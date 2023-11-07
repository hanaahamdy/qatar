
import 'package:dio/dio.dart';
import 'package:ehsan_1/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/langauge_manager.dart';
import '../../../../core/ui/items_shimmer/base_container_shimmer.dart';
import '../../../../core/utils/functions.dart';
import '../../../../core/utils/texts.dart';
import '../bloc/about_bloc.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

AboutBloc _bloc = AboutBloc();

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    _bloc.add(AboutEvent(cancelToken: CancelToken()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: font16Text('عن التطبيق', fontWeight: FontWeight.bold),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: ColorManager.white,
          leading: Padding(
              padding: EdgeInsets.all(10.w),
              child: Get.locale ==ARABIC_LOCAL ? FaIcon(FontAwesomeIcons.chevronRight, color: ColorManager.black, size: 13.w,) :  FaIcon(FontAwesomeIcons.chevronLeft, color: ColorManager.black, size: 13.w,)

          ).onTap((){
            Get.back();
          })
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 23.h, left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: BlocBuilder<AboutBloc, AboutState>(
              bloc: _bloc,
              builder: (_, state) {
                if (state is AboutSuccess) {
                  var document = parse(state.data!.body!);
                  return Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(ImageAssets.logo1),
                      ),
                      heightSpace(34.h),
                      HtmlWidget(
                        state.data!.body!,
                       // webView: true,
                        // child: font12Text(
                        //     document.outerHtml,
                        //     fontWeight: FontWeight.w500),
                      )
                      // font12Text(
                      //     document.outerHtml,
                      //     fontWeight: FontWeight.w500)
                    ],
                  );
                }
                return Column(
                  children: [
                    BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 15.h),
                    heightSpace(10.h),
                    BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 15.h),
                    heightSpace(10.h),
                    BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 15.h),
                    heightSpace(10.h),
                    BaseContainerShimmer(width: MediaQuery.of(context).size.width, height: 15.h),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
