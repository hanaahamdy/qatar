import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:ehsan_1/features/services/domain/entity/gallery_entity.dart';
import 'package:ehsan_1/features/services/presentation/pages/gallery_page.dart';
import 'package:ehsan_1/features/services/presentation/pages/search/search_page.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/di.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/ui/items_shimmer/base_container_shimmer.dart';
import '../../../../core/ui/items_shimmer/service_shimmer_grid.dart';
import '../../../../core/ui/widgets/network/network_grid.dart';
import '../../../../core/ui/widgets/network/network_grid_without_refresh.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../account/presentation/pages/account_page.dart';
import '../../domain/entity/services_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/services_usecase.dart';
import '../bloc/gallery_bloc.dart';
import '../widgets/service_item_list.dart';

class ServicesPage extends StatefulWidget {
  ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {

  GalleryBloc _bloc = GalleryBloc();
  int _currentBanner = 0;
  bool _isLoading = true;
  List<GalleryEntity> data = [];

  @override
  void initState() {
    _bloc.add(GalleryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildAppBar(context),
                  _buildBannerWidget(),
                  _buildDotsWidget(),
                  heightSpace(25.h),
                  NetworkGridWithoutRefresh<ServicesEntity>(
                    enablePagination: false,
                    enableRefresh: false,
                    isScroll: true,
                    scrollDirection: Axis.vertical,
                    sliverGridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: MediaQuery
                          .of(context)
                          .size
                          .width /
                          (MediaQuery
                              .of(context)
                              .size
                              .height / 1.4),
                    ),
                    placeHolder: (context) {
                      return Center(
                          child: font16Text('no-services')
                      );
                    },
                    itemBuilder: (context, subject) {
                      return ServiceItemList(
                        servicesEntity: subject,
                      );
                    },
                    loader: (pageSize, pageIndex) async {
                      return GetServicesUseCase(locator<ServicesRepository>())(
                          NoParams(cancelToken: CancelToken()));
                    },
                    loadingWidgetBuilder: (context) {
                      return ServiceShimmerGrid(count: 8,);
                    },
                  ),
                ],
              ),
            )));
  }

  _buildDotsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(int i=0; i< data.length; i++)
         Padding(
           padding: EdgeInsets.only(left: 4.w, right: 4.w),
           child: Container(
            width: 13.w,
            height: 3.h,
            decoration: BoxDecoration(
              color: _currentBanner == i
                  ? ColorManager.primary
                  : ColorManager.grey,
              borderRadius: BorderRadius.all(Radius.circular(2.r)),
            ),
        ),
         ),
      //  widthSpace(4.w),
        // Container(
        //   width: 13.w,
        //   height: 3.h,
        //   decoration: BoxDecoration(
        //     color: _currentBanner == 1
        //         ? ColorManager.primary
        //         : ColorManager.grey2,
        //     borderRadius: BorderRadius.all(Radius.circular(2.r)),
        //   ),
        // ),
        // widthSpace(4.w),
        // Container(
        //   width: 13.w,
        //   height: 3.h,
        //   decoration: BoxDecoration(
        //     color: _currentBanner == 2
        //         ? ColorManager.primary
        //         : ColorManager.lightGrey,
        //     borderRadius: BorderRadius.all(Radius.circular(2.r)),
        //   ),
        // ),
      ],
    );
  }

  _buildBannerWidget() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: BlocListener<GalleryBloc, GalleryState>(
          bloc: _bloc,
          listener: (_, state) {
            if (state is GallerySuccess) {
              setState(() {
                _isLoading = false;
                data = state.data;
              });
            } else if (state is GalleryFailure) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          child: _isLoading ? BaseContainerShimmer(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 138.h,
          ) : data.isEmpty ? Center(
              child: font14Text('لا يوحد صور')
          ) : ExpandablePageView(
              children: [
                for(int i = 0; i < data.length; i++)
                  _buildBannerImage(context, data[i], data, i),
              ],
              onPageChanged: (index) {
                setState(() {
                  _currentBanner = index;
                });
              })
      ),
    );
  }

  _buildBannerImage(BuildContext context, GalleryEntity? image, List<GalleryEntity> data, int index) {
    return SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 138.h,
        child: CachedNetworkImage(
          imageUrl: image!.image ?? "",
          imageBuilder: (context, imageProvider) =>
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.w)),
                  border: Border.all(width: 1.w, color: ColorManager.grey1),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
          placeholder: (context, url) =>
              BaseContainerShimmer(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 138.h,
              ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        )
    ).onTap(() async{
      Get.to(GalleryPage(galleryItems: data, index: index));
      //if(await canLaunchUrl(Uri.parse(image.url!))){
        //launchUrl(Uri.parse(image.url!));
      //}
    });
  }

  _buildAppBar(BuildContext context) {
    return Container(
        height: 70.h,
        width: MediaQuery
            .of(context)
            .size
            .width,
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(ImageAssets.search,
                      height: 20.h, width: 20.w)
              ).onTap(() {
                Get.to(SearchPage(hint: 'بحث في الخدمات'));
              }),
              Align(
                  alignment: Alignment.center,
                  child: font16Text(
                "منتج قطري",
                    fontWeight: FontWeight.bold,
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(ImageAssets.user,
                    height: 20.h, width: 20.w, color: ColorManager.primary)
                    .onTap(() {
                  Get.to(AccountPage());
                }),
              ),
            ],
          ),
        ));
  }
}

