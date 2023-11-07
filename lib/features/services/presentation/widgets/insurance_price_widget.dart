// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../../../core/resources/assets_manager.dart';
// import '../../../../core/resources/color_manager.dart';
// import '../../../../core/utils/functions.dart';
// import '../../../../core/utils/texts.dart';
// import '../pages/details/bids_details_page.dart';
//
// class InsurancePriceWidget extends StatelessWidget {
//   const InsurancePriceWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//    return  IntrinsicHeight(
//       child: state.data.bidDate ==null ? Container() : Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           _buildFooter('التأمين الابتدائي', ImageAssets.moneys, state.data.insurancePrice ??''),
//           VerticalDivider(
//             color: Colors.black12,
//             thickness: 1.w,
//           ),
//           _buildFooter('الوقت المتبقى', ImageAssets.clock, accountDate(state.data.bidDate ??'')),
//           VerticalDivider(
//             color: Colors.black12,
//             thickness: 1.w,
//           ),
//           _buildFooter('كراسة الشروط', ImageAssets.note, state.data.termsPrice??''),
//         ],
//       ),
//     );
//   }
//
// }
// _buildFooter(text, icon, price) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.end,
//     mainAxisSize: MainAxisSize.min,
//     children: [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SvgPicture.asset(icon, height: 20.h, width: 20.w),
//           heightSpace(6.h),
//           font12Text(text, fontWeight: FontWeight.bold),
//           heightSpace(8.h),
//           font12Text(price,
//               fontWeight: FontWeight.bold, color: ColorManager.primary),
//         ],
//       ),
//     ],
//   );
// }
