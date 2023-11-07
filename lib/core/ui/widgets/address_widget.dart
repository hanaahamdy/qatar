import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/functions.dart';
import '../../utils/texts.dart';
class AddressWidget extends StatefulWidget {
  final String address;
  const AddressWidget({Key? key, required this.address}) : super(key: key);

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(ImageAssets.location,
            height: 18.h, width: 18.w),
        widthSpace(5.w),
        Expanded(child: font14Text(widget.address, color: ColorManager.grey2)),
      ],
    );
  }
}
