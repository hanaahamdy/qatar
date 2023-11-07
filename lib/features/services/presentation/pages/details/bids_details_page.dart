import 'package:dio/dio.dart';
import 'package:ehsan_1/core/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/ui/add_any_widget.dart';
import '../../../../../core/ui/items_shimmer/service_details_shimmer.dart';
import '../../../../../core/ui/widgets/address_widget.dart';
import '../../../../../core/ui/widgets/album_widget.dart';
import '../../../../../core/ui/widgets/connect_widget.dart';
import '../../../../../core/ui/widgets/network/network_list_without_refresh.dart';
import '../../../../../core/ui/widgets/styled_button.dart';
import '../../../../../core/utils/app_prefs.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../../core/ui/widgets/advertiser_widget.dart';
import '../../../../../core/ui/widgets/location_widget.dart';
import '../../../../../core/utils/texts.dart';
import '../../../../booking/booking_page.dart';
import '../../../data/model/service_details_model.dart';
import '../../../domain/repository/services_repository.dart';
import '../../bloc/service_details_bloc.dart';
import '../../widgets/category_show_widget.dart';
import '../../widgets/custom_fields_widget.dart';
import '../../widgets/files_widget.dart';

class BidsDetailsPage extends StatefulWidget {
  final int? id;

  BidsDetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<BidsDetailsPage> createState() => _BidsDetailsPageState();
}

ServiceDetailsBloc _bloc = ServiceDetailsBloc();

class _BidsDetailsPageState extends State<BidsDetailsPage> {
  bool _auth = false;

  _isAuth() async {
    var authVal = await locator<AppPreferences>().hasToken;
    setState(() {
      _auth = authVal;
    });
  }

  @override
  void initState() {
    super.initState();
    _isAuth();
    _bloc.add(ServicesEvent(serviceId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: BlocBuilder<ServiceDetailsBloc, ServicesState>(
          bloc: _bloc,
          builder: (_, state) {
            if (state is ServicesSuccess) {


              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AlbumWidget(
                    fav: state.data.isFavourite,
                    gallery: state.data.gallery!.isNotEmpty
                        ? state.data.gallery!
                        : [
                            Gallery(id: 1, name: 'file', file: state.data.logo!)
                          ],
                    views: state.data.views ?? 0,
                    id: state.data.id,
                  ),
                  heightSpace(20.h),
                  Padding(
                      padding: EdgeInsets.only(right: 16.w, left: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.data.category == null
                              ? Container()
                              : CategoryShowWidget(
                                  text: state.data.category!.name!),
                          heightSpace(15.h),
                          font15Text(state.data.title ?? '',
                              fontWeight: FontWeight.bold),
                          heightSpace(15.h),
                          state.data.address == null
                              ? Container()
                              : AddressWidget(address: state.data.address!),
                          heightSpace(20.h),
                          state.data.description == null
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    font15Text('الوصف',
                                        fontWeight: FontWeight.bold),
                                    heightSpace(16.h),
                                    state.data.description != null
                                        ? Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16.w),
                                            child: HtmlWidget(
                                              state.data.description ?? "",
                                            ),
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                          heightSpace(16.h),
                          _auth == true
                              ? StyledButton(
                                  function: () {
                                    Get.to(BookingPage(adId: widget.id));
                                  },
                                  fillColor: ColorManager.primary,
                                  radius: true,
                                  child: font16Text('حجز',
                                      color: ColorManager.white,
                                      fontWeight: FontWeightManager.bold),
                                )
                              : Container(),
                          heightSpace(24.h),
                          state.data.whatsapp == null &&
                                  state.data.phone == null &&
                                  state.data.email == null
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    font15Text('التواصل',
                                        fontWeight: FontWeight.bold),
                                    heightSpace(16.h),
                                    Wrap(
                                     spacing: 3,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment:
                                      //     CrossAxisAlignment.center,
                                      children: [
                                        state.data.whatsapp == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                type: 'whats',
                                                text: 'ارسال طلب',
                                                icon: ImageAssets.whats,
                                                launcher: state.data.whatsapp),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 4.w,
                                        ),
                                        state.data.phone == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                type: 'call',
                                                text: 'اتصال',
                                                icon: ImageAssets.call,
                                                launcher: state.data.phone,
                                              ),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 4.w,
                                        ),
                                        state.data.email == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                type: 'mail',
                                                text: 'البريد',
                                                icon: ImageAssets.mail,
                                                svg: true,
                                                launcher: state.data.email),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 4.w,
                                        ),
                                        state.data.website == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                type: 'web',
                                                text: 'الموقع',
                                                icon: ImageAssets.website,
                                                launcher: state.data.website)
                                        // state.data.linkdin
                                        ,
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 5.w,
                                        ),
                                        state.data.linkedin == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                launcher: state.data.linkedin,
                                                type: 'linkedin',
                                                text: 'لينكد ان',
                                                icon: ImageAssets.linkdin,
                                              ),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 5.w,
                                        ),
                                        state.data.youtube == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                launcher: state.data.youtube,
                                                type: 'youtube',
                                                text: 'يوتيوب',
                                                icon: ImageAssets.youtube,
                                              ),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 5.w,
                                        ),
                                        state.data.facebook == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                launcher: state.data.facebook,
                                                type: 'facebook',
                                                text: 'فيسبوك',
                                                icon: ImageAssets.facebook1,
                                              ),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 3.w,
                                        ),
                                        state.data.instagram == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                launcher: state.data.instagram,
                                                type: 'instagram',
                                                text: 'انستجرام',
                                                icon: ImageAssets.instgram,
                                              ),
                                        VerticalDivider(
                                          color: Colors.black12,
                                          thickness: 3.w,
                                        ),
                                        state.data.twitter == null
                                            ? const SizedBox()
                                            : ConnectWidget(
                                                launcher: state.data.twitter,
                                                type: 'twitter',
                                                text: 'تويتر',
                                                icon: ImageAssets.twitter,
                                              )
                                      ],
                                    ),
                                  ],
                                ),
                          state.data.user == null
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    heightSpace(24.h),
                                    font15Text('المعلن',
                                        fontWeight: FontWeight.bold),
                                    heightSpace(16.h),
                                    AdvirtiserWidget(user: state.data.user!),
                                  ],
                                ),
                          heightSpace(16.h),
                          state.data.serviceCustomData == null
                              ? Container()
                              : CustomFieldsWidgets(
                                  customs: state.data.serviceCustomData!),
                          heightSpace(24.h),
                          state.data.lng == null ||
                                  state.data.lat == null ||
                                  state.data.lat!.isEmpty ||
                                  state.data.lng!.isEmpty
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // heightSpace(24.h),
                                    font15Text('الخريطة',
                                        fontWeight: FontWeight.bold),
                                    heightSpace(16.h),
                                    LocationWidget(
                                        myLocation: LatLng(
                                            double.parse(state.data.lat!),
                                            double.parse(state.data.lng!))),
                                  ],
                                ),
                          heightSpace(16.h),
                          state.data.files == null || state.data.files!.isEmpty
                              ? Container()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    heightSpace(24.h),
                                    font15Text('الملفات',
                                        fontWeight: FontWeight.bold),
                                    heightSpace(20.h),
                                    FilesWidget(
                                      files: state.data.files!,
                                    ),
                                  ],
                                ),
                          heightSpace(24.h),
                        ],
                      ))
                ],
              );
            } else if (state is ServicesLoading) {
              return const ServiceDetailsShimmer();
            }
            return const ServiceDetailsShimmer();
          },
        ),
      ),
    ));
  }
}

_buildAnnounceWidget(date) {
  return Container(
    decoration: BoxDecoration(
        color: ColorManager.lightGrey,
        borderRadius: BorderRadius.all(Radius.circular(6.w))),
    child: Padding(
      padding:
          EdgeInsets.only(right: 33.w, top: 17.h, bottom: 17.h, left: 33.w),
      child: Row(
        children: [
          SvgPicture.asset(ImageAssets.call1),
          widthSpace(7.w),
          Column(
            children: [
              font14Text('تاريخ الطرح', fontWeight: FontWeight.w900),
              heightSpace(7.h),
              font12Text(date, color: ColorManager.grey2)
            ],
          )
        ],
      ),
    ),
  );
}

accountDate(date) {
  final dt1 = DateFormat('dd/MM/yyyy').parse(date);
  final dt2 = DateTime.now();

  return '${dt2.difference(dt1).inDays.abs().toString()} يوم ';
}
