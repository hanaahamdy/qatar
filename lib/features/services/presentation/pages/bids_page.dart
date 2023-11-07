import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../core/di/di.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/ui/items_shimmer/horizontal_shimmer_list.dart';
import '../../../../core/ui/items_shimmer/service_loading_widget.dart';
import '../../../../core/ui/widgets/category_item_list.dart';
import '../../../../core/ui/widgets/general_widgets/error_widgets.dart';
import '../../../../core/ui/widgets/network/network_list_without_refresh.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../../../core/ui/widgets/bids_item_widget.dart';
import '../../domain/entity/add_service_entity.dart';
import '../../domain/entity/categories_service_entity.dart';
import '../../domain/repository/services_repository.dart';
import '../../domain/usecase/adds_service.dart';
import '../../domain/usecase/categories_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/category_service_bloc.dart';
import '../bloc/get_service_adds_usecase.dart';
import '../widgets/actions_widget.dart';
import 'address_page.dart';

RefreshController _refreshController = RefreshController(initialRefresh: false);
CategoriesServiceBloc _categoriesServiceBloc = CategoriesServiceBloc();

class BidsPage extends StatefulWidget {
  final int? id;
  final String? title;

  const BidsPage({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<BidsPage> createState() => _BidsPageState();
}

class _BidsPageState extends State<BidsPage> {
  int categoryServiceId = 1;
  dynamic loader;
  int len = 0;
  late CategoriesServiceEntity entity;
  int _currIndex = 0;
  List<AddServiceEntity> markers = [];
  String order = "";

  AddsServiceBloc _bloc = AddsServiceBloc();
  List<AddServiceEntity> adds = [];
  bool _clickAll = true;

  @override
  void initState() {
    super.initState();
    _categoriesServiceBloc.add(CategoriesServiceEvent(serviceId: widget.id));
    _bloc.add(ServicesEvent(serviceId: widget.id, catId: categoryServiceId, all: true));
  //  _function(order);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: font16Text(widget.title ?? '', fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: ColorManager.white,
          leading: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Get.locale == ARABIC_LOCAL
                      ?
                      Icon(FontAwesomeIcons.chevronRight,
                        color: ColorManager.black,
                        size: 14.w,)

                      :  Icon(FontAwesomeIcons.chevronRight,
                    color: ColorManager.black,
                    size: 14.w,))
              .onTap(() {
            Get.back();
          })),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: markers.isEmpty
          ? Container()
          : FloatingActionButton.extended(
              backgroundColor: ColorManager.primary,
              onPressed: () {
                if (markers.isNotEmpty) {
                  Get.to(AddressPage(
                    markers: markers,
                    add: false,
                  ));
                }
              },
              label: font14Text('الخريطه', color: ColorManager.white),
              icon: Icon(Icons.map, color: ColorManager.white)),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    color: ColorManager.white,
                    child: IntrinsicWidth(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16.h),
                        child: BlocListener<AddsServiceBloc, ServicesState>(
                          bloc: _bloc,
                          listener: (_, state) {
                            if (state is ServicesSuccess) {
                              setState(() {
                                markers = state.data!;
                              });
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ActionsWidget(
                                id: widget.id,
                                categoryServiceId: categoryServiceId,
                                function: _function,
                                back: _back,
                                hint: '.. بحث في ${widget.title}',
                              ),
                              heightSpace(24.h),
                              Divider(
                                thickness: 1.h,
                                color: Colors.black12,
                              ),
                              heightSpace(14.h),
                              BlocBuilder<CategoriesServiceBloc,
                                  CategoriesServiceState>(
                                bloc: _categoriesServiceBloc,
                                builder: (_, state) {
                                  if (state is CategoriesServiceSuccess) {
                                    return SizedBox(
                                      height: 20.h,
                                      child: ListView.builder(
                                          itemCount: state.data.length+1,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (_, index) {
                                            return index == 0
                                                ? Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 30.w,
                                                          right: 15.w,
                                                        ),
                                                        child: font14Text(
                                                            'الكل',
                                                            color: _clickAll ==
                                                                    true
                                                                ? ColorManager
                                                                    .primary
                                                                : ColorManager
                                                                    .grey2,
                                                            textAlign: TextAlign
                                                                .center,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                    .onTap(() {
                                                    setState(() {
                                                      _clickAll = !_clickAll;
                                                    });
                                                    _bloc.add(ServicesEvent(serviceId: widget.id, catId: categoryServiceId, all: true));
                                                  })
                                                : CartegoryItemList(
                                                    subject: state
                                                        .data[index-1].name!,
                                                    color:
                                                        _currIndex == index && _clickAll==false,
                                                  ).onTap(() {
                                                    setState(() {
                                                      _currIndex = index;
                                                      categoryServiceId = state
                                                          .data[index-1].id!;
                                                      _clickAll = false;
                                                      _function(order);
                                                    });
                                                  });
                                          }),
                                    );
                                  } else if (state
                                      is CategoriesServiceLoading) {
                                    return HorizontalShimmerList();
                                  }
                                  return Container();
                                },
                              ),
                              /*                        SizedBox(
                                height: 30.h,
                                child: NetworkListWithoutRefresh<CategoriesServiceEntity>(
                                  enablePagination: false,
                                  enableRefresh: false,
                                  isScroll: true,
                                  scrollDirection: Axis.horizontal,
                                  placeHolder: (context) {
                                    return Container();
                                  },
                                  itemBuilder: (context, subject, index) {
                                    return CartegoryItemList(
                                      subject: subject.name!,
                                       color: _currIndex ==index,
                                    ).onTap((){
                                       setState(() {
                                        _currIndex = index;
                                         categoryServiceId = subject.id!;
                                        _function("");
                                       });
                                    });
                                  },
                                  getItems: (subjects) {},
                                  loader: (pageSize, pageIndex) {
                                     return GetCategouriesServicesUseCase(locator<ServicesRepository>())(
                                        GetCategouriesServicesParams(cancelToken: CancelToken(), serviceId: widget.id!));

                                  },
                                  loadingWidgetBuilder: (context) {
                                    return HorizontalShimmerList();
                                  },
                                ),
                              ),*/
                              heightSpace(15.h),
                            ],
                          ),
                        ),
                      ),
                    )),
                heightSpace(20.h),
                adds.isNotEmpty
                    ? _buildFilterList()
                    : BlocBuilder<AddsServiceBloc, ServicesState>(
                        bloc: _bloc,
                        builder: (_, state) {
                          if (state is ServicesSuccess) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 10.h, right: 10.w),
                                    child: font16Text(
                                        'الكل (${state.data!.length})',
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.end)),
                                heightSpace(20.h),
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return Padding(
                                        padding: EdgeInsets.only(
                                            bottom: 10.h, right: 10.w),
                                        child: BidsItemWidget(
                                            item: state.data![i]));
                                  },
                                  itemCount: state.data!.length,
                                )
                              ],
                            );
                          } else if (state is ServicesFailure) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                UnexpectedErrorWidget(
                                    callback: state.callback,
                                    message: state.error!.message ?? ''),
                                //    SubscribeButton()
                              ],
                            );
                          }
                          return ServiceLoadingWidget();
                        },
                      ),
                heightSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _function(sort) {
    _bloc.add(ServicesEvent(
        serviceId: widget.id, catId: categoryServiceId, sort: sort, all: false));
    // setState(() {
    //    order = sort;
    // });
  }

  _back(result) {
    setState(() {
      adds = result;
      print("adds len ${adds.length}");
    });
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    _function(order);
    _refreshController.loadComplete();
  }

  _buildFilterList() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
            padding: EdgeInsets.only(bottom: 10.h, right: 10.w),
            child: BidsItemWidget(item: adds[i]));
      },
      itemCount: adds.length,
    );
  }
}
