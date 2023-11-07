
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/ui/search_Widget.dart';
import '../../../../core/ui/widgets/order_widget.dart';
import '../../../../core/utils/functions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entity/add_service_entity.dart';
import '../args/filter_args.dart';
import '../pages/filter_page.dart';

class ActionsWidget extends StatefulWidget {
  final int? id;
  final int? categoryServiceId;
  final Function function;
  final String? hint;
  final Function? back;

   ActionsWidget({Key? key, required this.function, required this.id,
     required this.categoryServiceId, required this.hint,  this.back}) : super(key: key);

  @override
  State<ActionsWidget> createState() => _ActionsWidgetState();
}

class _ActionsWidgetState extends State<ActionsWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchWidget(
              width: 270.w,
              hint: widget.hint,
             ),
            Image.asset(ImageAssets.filter,
                height: 24.h, width: 24.w, color: ColorManager.primary).onTap(() async{
                 List<AddServiceEntity> adds = await Get.to(FilterPage(), arguments: FilterArgs(widget.id, widget.categoryServiceId));
                 widget.back!(adds);
            }),
            SvgPicture.asset(ImageAssets.order,
                height: 24.h, width: 24.w, color: ColorManager.primary).onTap((){

              showModalBottomSheetWidget(context,
                  OrderWidget(id: widget.id!, catId: widget.categoryServiceId,
                      callback: widget.function
                  ));
            }),
          ],
        )
    );
  }
}
