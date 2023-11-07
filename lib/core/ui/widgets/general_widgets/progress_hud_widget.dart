import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../resources/color_manager.dart';
class ProgressHudWidget extends StatefulWidget {
  final Widget child;
  const ProgressHudWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<ProgressHudWidget> createState() => _ProgressHudWidgetState();
}

class _ProgressHudWidgetState extends State<ProgressHudWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
       children: [
         widget.child,
         Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,
           decoration: BoxDecoration(
             color: ColorManager.grey1.withOpacity(0.5)
           ),
         ),
         Center(
           child: SizedBox(
             width: 40.w,
             height: 40.h,
             child: CircularProgressIndicator(
               color: ColorManager.primary,
               strokeWidth: 5.w,
             ),
           ),
         )
       ],
      ),
    );
  }
}
