
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/ui/widgets/views_widget.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../features/services/data/model/service_details_model.dart';
import '../../../features/services/data/request/service_details_request.dart';
import '../../../features/services/domain/entity/gallery_entity.dart';
import '../../../features/services/domain/repository/services_repository.dart';
import '../../../features/services/domain/usecase/add_favorite.dart';
import '../../../features/services/presentation/pages/gallery_page.dart';
import '../../di/di.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
String path1 =
    'https://img.freepik.com/free-photo/old-black-background-grunge-texture-dark-wallpaper-blackboard-chalkboard-room-wall_1258-28312.jpg?w=1380&t=st=1662390237~exp=1662390837~hmac=13203651c902e6d1725beac4451bcfb0ca6f881c0cb7426ab1361b163b4ccdf8';

int favorite = 0;
int currentIndex = 0;

class AlbumWidget extends StatefulWidget {
  List<Gallery> gallery;
  int? views;
  int? id;
  final int? fav;

  AlbumWidget(
      {Key? key,
        required this.gallery,
        required this.views,
        required this.id,
        required this.fav})
      : super(key: key);

  @override
  State<AlbumWidget> createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  @override
  void initState() {
    initFav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 230.h,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ColorManager.grey2,
                borderRadius: BorderRadius.all(Radius.circular(6.w))),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: widget.gallery.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return VisibilityDetector(
                        key: Key(index.toString()),
                        onVisibilityChanged: (VisibilityInfo info) {
                          if (info.visibleFraction == 1) {
                            setState(() {
                              currentIndex = index;
                            });
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl: widget.gallery[index].file ??
                              'https://qsport.club/uploads/ads/gallery/16683496216370feb59acf61.24044798ert3.PNG',
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              height: 230.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.fill,
                                ),
                              ),
                            ).onTap((){
                             List<GalleryEntity> images = widget.gallery.map((e) => GalleryEntity(image: e.file)).toList();
                              Get.to(GalleryPage(galleryItems: images , index: index));
                            });
                          },
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
                //Stback-----------------------
                Positioned(
                    right: 15.w,
                    top: 38.h,
                    child: Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(6.w)),
                          color: ColorManager.white.withOpacity(0.2),
                          shape: BoxShape.rectangle),
                      child: Center(
                        child: SvgPicture.asset(ImageAssets.arrow_back,
                            height: 17.h, width: 17.w),
                      ),
                    ).onTap(() {
                      Navigator.of(context).pop();
                    })),
                //favorite---------------------------------
                // Positioned(
                //     left: 16.w,
                //     top: 38.h,
                //     child: Container(
                //       width: 40.w,
                //       height: 40.h,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(6.w)),
                //           color: ColorManager.white.withOpacity(0.2),
                //           shape: BoxShape.rectangle),
                //       child: Center(
                //         child: SvgPicture.asset(
                //           ImageAssets.heart,
                //           height: 24.h,
                //           width: 24.w,
                //           color:
                //           favorite == 0 ? ColorManager.white : ColorManager.primary,
                //         ),
                //       ),
                //     ).onTap(() {
                //       _handleFavState();
                //       AddFavoriteUseCase(locator<ServicesRepository>())(
                //           AddFavoriteParams(
                //               data:
                //               ServiceDetailsRequest(serviceId: widget.id!),
                //               cancelToken: CancelToken()));
                //     })),
                Positioned(
                    left: 0.w,
                    right: 0.w,
                    bottom: 15.h,
                    child: _buildDotsWidget())
              ],
            )),
        ViewsWidget(views: widget.views.toString())
      ],
    );
  }

  _buildDotsWidget() {
    return SizedBox(
      height: 6.h,
      child: Center(
          child: Wrap(
            children: [
              for (var i = 0; i < widget.gallery.length; i++)
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Container(
                    width: 10.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: currentIndex == i
                          ? ColorManager.primary
                          : ColorManager.white,
                      borderRadius: BorderRadius.all(Radius.circular(2.r)),
                    ),
                  ),
                )
            ],
          )),
    );
  }

  void initFav() {
    setState(() {
      favorite = widget.fav!;
    });
  }

  void _handleFavState() {
    if (favorite == 1) {
      setState(() {
        favorite = 0;
      });
    } else {
      setState(() {
        favorite = 1;
      });
    }
  }
}
