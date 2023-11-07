import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../features/services/presentation/widgets/category_show_widget.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';

class TimeWidget extends StatelessWidget {
  final List<dynamic> data;
  final String? category;
  const TimeWidget({Key? key, required this.data, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showDateOrCategory();
    // return Container(
    //   //height: 22.h,
    //   decoration: BoxDecoration(
    //       color: ColorManager.lightGrey,
    //       borderRadius: BorderRadius.all(Radius.circular(11.w))),
    //   child: Padding(
    //     padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 8.w, right: 8.w),
    //     child: Row(
    //       children: [
    //         SvgPicture.asset(ImageAssets.clock, height: 17.h, width: 17.w),
    //         widthSpace(4.w),
    //          //font12Text(date)
    //         font12Text('متبقى ${accountDate(data.firstWhere((element) {
    //           return element.name!.contains('bid_date');
    //         }).value!)} يوم', color: ColorManager.primary)
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget showDateOrCategory(){
    if (data==null || data.isEmpty || checkBidDateExistence(data)==false){
       return CategoryShowWidget(text: category!);
    }else{
      return Container(
        //height: 22.h,
        decoration: BoxDecoration(
            color: ColorManager.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(11.w))),
        child: Padding(
          padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 8.w, right: 8.w),
          child: Row(
            children: [
              SvgPicture.asset(ImageAssets.clock, height: 17.h, width: 17.w),
              widthSpace(4.w),
              //font12Text(date)
              font12Text('متبقى ${accountDate(data.firstWhere((element) {
                return element.name!.contains('bid_date');
              }).value!)} يوم', color: ColorManager.primary)
            ],
          ),
        ),
      );
    }
  }

  bool checkBidDateExistence(List<dynamic> fields){
      for(var i in fields){
        if(i.name!.contains('bid_date')){
          return true;
        }
      }
      return false;
  }

  accountDate(String date){
    if(date.isEmpty){
      return '';
    }
    final dt1 =   DateFormat('dd/MM/yyyy').parse(date);
    final dt2 =   DateTime.now();
    return dt2.difference(dt1).inDays.abs().toString();
  }
}
