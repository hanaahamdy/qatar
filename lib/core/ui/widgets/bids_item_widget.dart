
import 'package:ehsan_1/core/ui/widgets/time_widget.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../features/services/domain/entity/add_service_entity.dart';
import '../../../features/services/presentation/pages/details/bids_details_page.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';
import 'address_widget.dart';
import 'connect_widget.dart';
import 'footer_widget.dart';
import 'image/image_widget.dart';

String path =
    'https://img.freepik.com/free-photo/low-angle-shot-facade-white-modern-building-blue-clear-sky_181624-48219.jpg?w=996&t=st=1661799352~exp=1661799952~hmac=7467f2525ef8360a12f9d18bf36e6a11c8d9daae74c05eaf6f805c9c6f503d58';

class BidsItemWidget extends StatelessWidget {
  final AddServiceEntity item;
  const BidsItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-70.w,
      margin: EdgeInsets.only(left: 10.w,),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          border: Border.all(color: ColorManager.grey1, width: 1.w)),
      child: Padding(
          padding:
              EdgeInsets.only(top: 15.h, bottom: 11.h, right: 15.w, left: 20.w),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: ImageWidget(   width: 107.w, height: 98.h,url: item.logo, favotite: item.is_favourite)),
                    widthSpace(15.w),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          item.serviceCustomData ==null ?const SizedBox() :TimeWidget(data: item.serviceCustomData!, category: item.category?.name!),
                          heightSpace(9.h),
                          SizedBox(
                            width: 120.w,
                              child: font12Text(
                                  item.title ?? '',
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.start)),
                          heightSpace(11.h),
                          AddressWidget(address: item.address ??'')
                        ],
                      ),
                    ),

                  ],
                ),
                heightSpace(14.h),
                Divider(
                  color: Colors.black12,
                  thickness: 1.h,
                ),
                heightSpace(10.h),

                item.serviceCustomData==null ? Container() : _buildFooterWidget(),
              ],
            ),
          )),
    ).onTap((){
      Get.to(BidsDetailsPage(id: item.id!));

    });
  }

  _buildFooterWidget() {
    if(item.serviceCustomData==null || item.serviceCustomData!.isEmpty || item.serviceCustomData!.length < 2){
         return  SizedBox(
           width: 240.w,
           child: IntrinsicHeight(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 ConnectWidget(
                     type: 'whats',
                     text:'إرسال طلب', icon:ImageAssets.whats, launcher: item.whatsapp),
                 VerticalDivider(
                   color: Colors.black12,
                   thickness: 1.w,
                 ),
                 ConnectWidget(
                   type: 'call',
                   text:'اتصال',icon: ImageAssets.call, launcher: item.phone,),
               ],
             ),
           ),
         );
    }else{
    return SizedBox(
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FooterWidget(text:item.serviceCustomData![0].labelTitle ,icon: ImageAssets.moneys, price:item.serviceCustomData![0].value),
            VerticalDivider(
              color: Colors.black12,
              thickness: 1.w,
            ),
            FooterWidget(text:item.serviceCustomData![1].labelTitle ,icon: ImageAssets.moneys, price:item.serviceCustomData![1].value),

          ],
        ),
      ),
    );
  }}




}
