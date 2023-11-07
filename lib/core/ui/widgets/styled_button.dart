import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../resources/color_manager.dart';

class StyledButton extends StatelessWidget {
  final Color? fillColor;
  final Color? border;
  final double? width;
  final Function function;
  final bool? radius;
  final Widget child;
  final double? height;

  const StyledButton({Key? key, required this.function,
    this.fillColor, this.radius, this.width, this.border,  required this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: border ?? ColorManager.white),
        borderRadius: radius!=null ? BorderRadius.all(Radius.circular(6.r)):  BorderRadius.all(Radius.circular(0.r)),
        color: fillColor?? ColorManager.primary),
      child: Center(
          child: child
      ),
    ).onTap(function);
  }
}