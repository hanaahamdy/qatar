import 'package:ehsan_1/core/ui/items_shimmer/service_item_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ServiceLoadingWidget extends StatelessWidget {
  const ServiceLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
            padding: EdgeInsets.only(bottom: 10.h,  right: 10.w),
            child: ServiceItemWidget()

        );
      },
      itemCount: 5,
    );
  }
}
