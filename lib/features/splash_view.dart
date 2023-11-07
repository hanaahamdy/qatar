import 'dart:async';

import 'package:ehsan_1/features/services/presentation/pages/services_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../core/resources/color_manager.dart';
import '../core/resources/constants_manager.dart';

bool isVisited = false;
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startDelay() async {
    await Future.delayed(const Duration(seconds: AppConstants.splashDelay), ()  async{
       Get.offAll(ServicesPage());
      // if(await locator<AppPreferences>().hasToken==true){
      //   Get.offAll(ServicesPage());
      // }else{
      //   Get.offAll(LoginScreen());
      // }
    });
  }
  @override
  void initState() {
    super.initState();
    _startDelay();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/logo.png',
                width: 250.w,
              height: 250.w,
              fit: BoxFit.contain,
            ),
          ),
        )
      // backgroundColor: Colors.transparent,
      // body: BlocListener<SplashBloc, SplashState>(
      //     bloc: _bloc,
      //     listener: (BuildContext context, state) async {
      //       if (state is SplashDoneState) {
      //         if (await locator<AppPreferences>().hasToken) {
      //           _bloc.add(SetupUserDataEvent(cancelToken: CancelToken()));
      //         } else {
      //           _navigateTo(context, false);
      //         }
      //       }
      //       if (state is SplashUserDataDoneState) {
      //         profileEntity = state.profile;
      //         _startDelay();
      //         _navigateTo(context, true);
      //       }
      //       if (state is SplashUserDataFailureState) {
      //         _navigateTo(context, false);
      //       }
      //     },
      //     child: BlocBuilder<SplashBloc, SplashState>(
      //         bloc: _bloc,
      //         builder: (BuildContext context, state) {
      //           return Center(
      //               child: Padding(
      //                   padding: EdgeInsets.symmetric(horizontal: 15.w),
      //                   child: Image(
      //                       image: AssetImage(ImageAssets.splashLogo))));
      //         }))
    );
  }

  // Future<void> _navigateTo(BuildContext context, bool isAuth) async {
  //   //update local with current one--
  //   Get.updateLocale(utils.getLang() =='ar' ? ARABIC_LOCAL : ENGLISH_LOCAL);
  //   //if (BlocProvider.of<ApplicationBloc>(context).isInitialized) {
  //
  //     if (isAuth == true) {
  //       BlocProvider.of<ApplicationBloc>(context)
  //           .add(SetProfileSplashEvent(profileEntity: profileEntity));
  //
  //       Navigator.pushReplacementNamed(context, Routes.mainRoute);
  //     } else {
  //       locator<AppPreferences>()
  //           .isOnBoardingScreenViewed()
  //           .then((isOnBoardingScreenViewed) => {
  //                 if (isOnBoardingScreenViewed)
  //                   {
  //                     // navigate to login screen
  //
  //                   }
  //                 else
  //                   {
  //                     // navigate to onboarding screen
  //                     Navigator.pushReplacementNamed(
  //                         context, Routes.onBoardingRoute)
  //                   }
  //               });
  //     }
  //     return;
  //   //}
  // }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}