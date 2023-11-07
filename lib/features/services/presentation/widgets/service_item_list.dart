import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../domain/entity/services_entity.dart';
import '../pages/bids_page.dart';

class ServiceItemList extends StatelessWidget {
  final ServicesEntity servicesEntity;

   ServiceItemList({Key? key, required this.servicesEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 103.h,
          width: 103.w,
          decoration: BoxDecoration(
            color: ColorManager.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
          ),
          child: Center(
            child: Image.network(servicesEntity.icon!,
               // height: 39.h, width: 39.w
            ),
          ),
        ),
        heightSpace(11.h),
        font14Text(servicesEntity.name!,overFlow:servicesEntity.name!.length>7?TextOverflow.ellipsis:null ,fontWeight: FontWeight.bold),
        // heightSpace(4.h),
        Card(
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: ColorManager.primary,
          child: Padding(
            padding:  EdgeInsets.all(4.w),
            child: font11Text('(${servicesEntity.count.toString()})',
                color: ColorManager.white, fontWeight: FontWeight.w500),
          ),
        )
      ],
    ).onTap(() {
      Get.to(BidsPage(id: servicesEntity.id, title: servicesEntity.name));

    });
  }
}
