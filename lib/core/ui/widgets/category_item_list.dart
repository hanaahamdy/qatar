
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../features/services/domain/repository/services_repository.dart';
import '../../../features/services/domain/usecase/adds_service.dart';
import '../../di/di.dart';
import '../../resources/color_manager.dart';
import '../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartegoryItemList extends StatefulWidget {

  final String subject;
  final bool color;

  CartegoryItemList(
      {Key? key,
      required this.subject,
      required this.color})
      : super(key: key);

  @override
  State<CartegoryItemList> createState() => _CartegoryItemListState();
}

class _CartegoryItemListState extends State<CartegoryItemList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(
              left: 30.w,
              right: 15.w,
            ),
            child: font14Text(widget.subject ?? '',
                color: widget.color==true ? ColorManager.primary : ColorManager.grey2,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold));
    //     .onTap(() {
    //   setState(() {
    //     color = ColorManager.primary;
    //     widget.categoryServiceId = widget.subject.id!;
    //     widget.loader = GetAddsServiceUseCase(locator<ServicesRepository>())(
    //         GetAddsServiceParams(
    //             cancelToken: CancelToken(),
    //             categoryId: widget.categoryServiceId,
    //             serviceId: widget.id));
    //   });
    // });
  }
}
