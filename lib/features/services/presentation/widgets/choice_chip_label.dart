
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
bool click = false;

List<int> cats = [];

class ChoiceChipLabel extends StatefulWidget {
  final text;
  final index;
  final clickedCategories;

  const ChoiceChipLabel({Key? key, required this.text, required this.index, this.clickedCategories})
      : super(key: key);

  @override
  State<ChoiceChipLabel> createState() => _ChoiceChipLabelState();
}

class _ChoiceChipLabelState extends State<ChoiceChipLabel> {
  @override
  void initState() {
    click = false;
    cats = [];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, bottom: 25.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
              click == true ? ImageAssets.checkbox : ImageAssets.outlined,
              color: ColorManager.primary),
          widthSpace(8.w),
          font14Text(widget.text)
        ],
      ).onTap(() {
        setState(() {
          click = !click;
          print('current : ${widget.index}');
        });
        if(click == true && !cats.contains(widget.index)){
          cats.add(widget.index);
        }else if(click ==false && cats.contains(widget.index)){
          cats.remove(widget.index);
        }
        widget.clickedCategories(cats);
      }),
    );

  }
}
