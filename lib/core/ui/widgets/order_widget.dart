
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../features/services/domain/repository/services_repository.dart';
import '../../../features/services/domain/usecase/order_usecase.dart';
import '../../di/di.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/font_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';

class OrderWidget extends StatefulWidget {
  final int? id;
  final int? catId;
  final Function callback;

  const OrderWidget(
      {Key? key, required this.id, required this.catId, required this.callback})
      : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

List<Order> order = [
  Order(name: 'من الأقدم الى الأحدث', sort: 'older'),
  Order(name: 'من الأحدث الى الأقدم', sort: 'newer'),
  Order(name: 'الأكثر مشاهدة', sort: 'most_views'),
  Order(name: 'عدد الأيام المتبيقية', sort: ''),
  Order(name: 'سعر التأمين الأقل', sort: ''),
  Order(name: 'سعر التأمين الأكثر', sort: ''),
  Order(name: 'كراسة الشروط الأقل', sort: ''),
  Order(name: 'كراسة الشروط الأكثر', sort: ''),
];

class _OrderWidgetState extends State<OrderWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))),
      child: IntrinsicWidth(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace(15.h),
              Center(
                child: Container(
                  width: 39.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: ColorManager.lightGrey,
                      borderRadius: BorderRadius.all(Radius.circular(158.r))),
                ),
              ),
              heightSpace(13.h),
              Padding(
                  padding:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                  child:
                      font16Text('ترتيب', fontWeight: FontWeightManager.bold)),
              heightSpace(13.h),
              Divider(
                thickness: 1.w,
                color: ColorManager.lightGrey,
              ),
              heightSpace(20.h),
              Padding(
                  padding:
                      EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, i) {
                      return _buildOrderItem(order[i], i);
                    },
                    itemCount: 3,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _buildOrderItem(Order order, index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Row(
        children: [
          font14Text(order.name, fontWeight: FontWeightManager.medium),
          const Spacer(),
          SvgPicture.asset(
            index == _currentIndex ?  ImageAssets.checkbox : ImageAssets.outlined,
            width: 24.w,
            height: 24.h,
            color: ColorManager.primary
          )
        ],
      ).onTap(() {
        setState(() {
          _currentIndex = index;
          widget.callback(order.sort);
        });
        Get.back();
      }),
    );
  }
}

class Order {
  final String name;
  final String? sort;

  Order({required this.name, required this.sort});
}
