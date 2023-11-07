import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../errors/base_error.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../utils/texts.dart';

class ShowErrorWidget extends StatefulWidget {
  Widget child;
  BaseError error;

   ShowErrorWidget({Key? key , required this.child, required this.error}) : super(key: key);

  @override
  State<ShowErrorWidget> createState() => _ShowErrorWidgetState();
}

class _ShowErrorWidgetState extends State<ShowErrorWidget> {

  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          widget.child,
          _showFailWidget(widget.error)


        ],
      ),
    );
  }
  _showFailWidget(error){
    return Center(
      child: Visibility(
        visible: visible,
        child: Container(
          width: 500.w,
          height: 200.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6.w)),
              color: ColorManager.white,
              border: Border.all(color: ColorManager.error, width: 2.w)
          ),
          child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Center(child: font14Text(_buildTextError(error), color: ColorManager.grey, fontWeight: FontWeightManager.bold))
          ),
        ).onTap((){
          setState(() {
            visible= false;
          });
        }),
      ),
    );

  }

}


_buildTextError(BaseError error) {
  return error.message;
  // if (error is ConnectionError) {
  //   return AppStrings.connectionError;
  // }
  // else if (error is UnauthorizedHttpError) {
  //   return AppStrings.unauthorizedError;
  // } else {
  //   return AppStrings.unknownError;
  // }
}