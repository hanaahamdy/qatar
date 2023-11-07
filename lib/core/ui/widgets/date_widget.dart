import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

DateTime now = DateTime.now();

class DateWidget extends StatefulWidget {
  Function setDtae;

   DateWidget({Key? key, required this.setDtae}) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {

  String selectedDate =  DateFormat('yyyy-MM-dd').format(now);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.w)),
          color: ColorManager.grey3),
      child: Padding(
        padding: EdgeInsets.all(15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            font14Text(selectedDate, fontWeight: FontWeightManager.bold),
            widthSpace(20.w),
            SvgPicture.asset(ImageAssets.calendar, color: ColorManager.primary)
          ],
        ),
      ),
    ).onTap(() async{
      var date = await showDatePickerFun(context);
      setState(() {
         selectedDate = date;
      });
        widget.setDtae(date);
    });
  }
}
