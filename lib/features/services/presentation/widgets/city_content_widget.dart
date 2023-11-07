import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../../domain/entity/city_entity.dart';

class CityContentWidget extends StatefulWidget {
  List<CityEntity> cities;
  Function function;
   CityContentWidget({Key? key, required this.cities, required this.function}) : super(key: key);

  @override
  State<CityContentWidget> createState() => _CityContentWidgetState();
}

class _CityContentWidgetState extends State<CityContentWidget> {

 int  _currentIndex =0;
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
                      return _buildOrderItem(widget.cities[i], i);
                    },
                    itemCount: widget.cities.length,
                  ))
            ],
          ),
        ),
      ),
    );
  }
  _buildOrderItem(CityEntity cityEntity, index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 28.h),
      child: Row(
        children: [
          font14Text(cityEntity.name!, fontWeight: FontWeightManager.medium),
          const Spacer(),
          SvgPicture.asset(
            index == _currentIndex ?  ImageAssets.checkbox : ImageAssets.outlined,
            width: 24.w,
            height: 24.h,
            color: ColorManager.primary,
          )
        ],
      )
    ).onTap(() {
      setState(() {
        _currentIndex = index;
        widget.function(cityEntity);
      });
      Get.back();
    });
  }
}
