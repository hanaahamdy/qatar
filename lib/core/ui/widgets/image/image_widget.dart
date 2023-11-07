import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';

class ImageWidget extends StatefulWidget {
  final String? url;
  final double? height;
  final double? width;
  final int? favotite;
   ImageWidget({Key? key, required this.width, required this.height,
     required this.url, required this.favotite}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6.w))),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.url?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: 107.w,
                height: 98.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6.w)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // Positioned(
            //     right: 10.w,
            //     top: 10.h,
            //     child: Container(
            //       width: 25.w,
            //       height: 25.h,
            //       decoration: BoxDecoration(
            //           color: ColorManager.white.withOpacity(0.6),
            //           shape: BoxShape.circle),
            //       child: Center(
            //         child: SvgPicture.asset(ImageAssets.heart,
            //             height: 17.h, width: 17.w, color: widget.favotite == 1? ColorManager.primary: ColorManager.grey ),
            //       ),
            //     ))
          ],
        ));
  }
}
