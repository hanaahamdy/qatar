import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../resources/color_manager.dart';
import '../../utils/functions.dart';
import '../../utils/texts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectWidget extends StatelessWidget {
  final text;
  final icon;
  final bool? svg;
  final launcher;
  final type;
  const ConnectWidget({Key? key, required this.text, required this.icon,  this.svg, required this.launcher, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(

                color: ColorManager.lightGrey,
                borderRadius: BorderRadius.all(Radius.circular(6.w))
            ),
            child: Center(
              child: svg ==null ? Image.asset(icon, height: 35.h, width: 35.w,):SvgPicture.asset(icon, height: 20.h, width: 20.w),
            ),
          ),
          widthSpace(5.w),
          font15Text(text, fontWeight: FontWeight.bold),

        ],
      ).onTap((){
        if(type=='call'){
          makePhoneCall(launcher);
        }
        else if(type == 'mail'){
          openUrl('mailto:${launcher}');
        }
        else if(type=="whats"){
          openWhatsapp(context,"https://$launcher");
        }
        else if(type =='web'){
          openUrl("https://$launcher");
        }
        else if(type =='youtube'){
          openUrl("https://$launcher");
        }
        else if(type =='linkedin'){
          openUrl( "https://$launcher");
        }
        else if(type =='facebook'){
          openUrl( "https://$launcher");
        }   else if(type =='twitter'){
          openUrl( "https://$launcher");

        }
        else if(type =='instagram'){
          openUrl( "https://$launcher");

        }
        // else if(type=="linkdin"){
        //   o
        // }
      }),
    );
  }
}
