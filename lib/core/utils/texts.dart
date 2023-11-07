import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../resources/color_manager.dart';

Widget font9Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 9.sp,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font11Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 11.sp,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font12Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign, TextDecoration? decoration}) {
  return Text(
    header,
    maxLines: 4,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 12.sp,
      fontFamily: 'LamaSans',
      decoration: decoration,
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}


Widget font13Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign, TextDecoration? decoration}) {
  return Text(
    header,
    maxLines: 1,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 13.sp,
      fontFamily: 'LamaSans',
      decoration: decoration,
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font14Text(String header,
    {Color? color, String? fontFamily, TextOverflow?overFlow,FontWeight? fontWeight, TextAlign? textAlign, TextDecoration? textDecoration}) {
  return Text(
    header,
    style: TextStyle(
      overflow:overFlow ??TextOverflow.ellipsis,
      fontWeight: fontWeight,
      fontSize: 14.sp,
      decoration: textDecoration,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    maxLines: 1,
    textAlign: textAlign,
  );
}

Widget font15Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign, TextDecoration? textDecoration}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 15.sp,
      decoration: textDecoration,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font16Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 16.sp,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font18Text(String header,{Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 18.sp,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font21Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 21.sp,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

Widget font22Text(String header,
    {Color? color, String? fontFamily, FontWeight? fontWeight, TextAlign? textAlign}) {
  return Text(
    header,
    style: TextStyle(
      fontWeight: fontWeight,
      fontSize: 22.sp,
      fontFamily: 'LamaSans',
      color: color ?? ColorManager.black,
    ),
    textAlign: textAlign,
  );
}

// Widget headerText(String header) {
//   return Text(
//     header,
//     style:
//     TextStyle(fontSize: 24, color: ColorManager.black, fontWeight: FontWeight.bold),
//   );
// }
//
// Widget stateText(String header, {Color? color}) {
//   return Text(
//     header,
//     textAlign: TextAlign.center,
//     style: TextStyle(
//       fontSize: 22,
//       color: color == null ? ColorManager.black : color,
//     ),
//   );
// }
//
// Widget normal16Text(String header, {Color? color}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontStyle: FontStyle.normal,
//       fontSize: 16,
//       color: color == null ? ColorManager.black : color,
//     ),
//   );
// }
//
// Widget reg14Text(String header, {Color? color}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.w200,
//       fontSize: 14.sp,
//       color: color == null ? HexColor('#5D5D5D') : color,
//     ),
//   );
// }
// //
// Widget reg16Text(String header, {Color? color}) {
//   return Text(
//     header,
//     textAlign: TextAlign.start,
//     style: TextStyle(
//       fontWeight: FontWeight.w200,
//       fontSize: 16.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//   );
// }
//
// //
// Widget bold26Text(String header, {Color? color}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 26.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//   );
// }
//
//
// Widget reg18Text(String header, {Color? color}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.w300,
//       fontSize: 18.sp,
//       color: color == null ? HexColor('#5D5D5D') : color,
//     ),
//   );
// }
// Widget bold24Text(String header, {Color? color, bool? align}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 24.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//     maxLines: 2,
//     overflow: TextOverflow.ellipsis,
//     textAlign: align==true ? TextAlign.center: null,
//   );
// }
//
// Widget bold18Text(String header, {Color? color, bool? align}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 18.sp,
//       color: color ?? ColorManager.black,
//     ),
//     maxLines: 2,
//     overflow: TextOverflow.ellipsis,
//     textAlign: align==true ? TextAlign.center: null,
//   );
// }
//
// Widget bold14Text(String header, {Color? color, bool? align}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 14.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//     maxLines: 2,
//     overflow: TextOverflow.ellipsis,
//     textAlign: align==true ? TextAlign.center: null,
//   );
// }
//

// Widget bold22Text(String header, {Color? color, TextAlign? textAlign}) {
//   return Text(
//     header,
//     textAlign: textAlign,
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 22.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//     maxLines: 2,
//     overflow: TextOverflow.ellipsis,
//   );
// }
// //
// Widget bold20Text(String header, {Color? color, TextAlign? textAlign}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontWeight: FontWeight.bold,
//       fontSize: 20.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//     maxLines: 2,
//     textAlign: textAlign,
//     overflow: TextOverflow.ellipsis,
//   );
// }
// //
// // Widget bold28Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 28.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// // Widget bold25Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 25.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// //
// // Widget bold21Text(String header, {Color? color, TextAlign? textAlign, int? maxlines}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 21.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //     textAlign: textAlign ?? TextAlign.justify,
// //     maxLines: maxlines ?? 1,
// //   );
// // }
// // Widget bold24Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 21.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// // Widget bold35Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 30.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// // Widget bold31Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 31.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// //
// // Widget bold11Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 11.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// //
// // Widget bold9Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 9.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// //
// // Widget bold7Text(String header, {Color? color}) {
// //   return Text(
// //     header,
// //     style: TextStyle(
// //       fontWeight: FontWeight.bold,
// //       fontSize: 7.sp,
// //       color: color == null ? blackColor : color,
// //     ),
// //   );
// // }
// //
// Widget normal14Text(String header, {Color? color}) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontSize: 14.sp,
//       color: color == null ? ColorManager.black : color,
//     ),
//   );
// }
// //
// Widget bold10Text(String header, {Color? color}) {
//   return Text(
//     header,
//     style: TextStyle(
//         fontSize: 10.sp,
//         color: color == null ? ColorManager.black : color,
//         fontWeight: FontWeight.bold),
//   );
// }
//
// Widget buttonText(String header) {
//   return Text(
//     header,
//     style: TextStyle(
//       fontSize: 14.sp,
//       color: Colors.white,
//     ),
//   );
// }
