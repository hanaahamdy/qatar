
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/bloc/application_bloc.dart';
import 'core/bloc/application_events.dart';
import 'core/bloc/application_state.dart';
import 'core/di/di.dart';
import 'core/resources/theme_manager.dart';
import 'core/resources/utils.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'core/translations/locale_strings.dart';
import 'features/splash_view.dart';

class MyApp extends StatefulWidget {

  String lang;

  MyApp({required this.lang});

  int appState = 0;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          translations: LocaleString(),
          debugShowCheckedModeBanner: false,
          locale: Locale('ar','EG'),
          theme: getApplicationTheme(),
          home: SplashView(),
        );
      },
    );

    // return AnnotatedRegion<SystemUiOverlayStyle>(
    //   value: SystemUiOverlayStyle(
    //     statusBarColor: Colors.black12,
    //   ),
    // child: MultiProvider(
    //     child: Builder(builder: (context) {
    //       return BlocBuilder<ApplicationBloc, ApplicationState>(
    //         bloc: BlocProvider.of<ApplicationBloc>(context),
    //         builder: (context, state) {
    //            final _lang = state.language ?? widget.lang;
    //            utils.setLang(_lang);
    //           return ScreenUtilInit(
    //             designSize: const Size(360, 690),
    //             minTextAdapt: true,
    //             splitScreenMode: true,
    //             builder: (BuildContext context, child) {
    //               return GetMaterialApp(
    //                 translations: LocaleString(),
    //                 debugShowCheckedModeBanner: false,
    //                 initialRoute: Routes.splashRoute,
    //                 onGenerateRoute: RouteGenerator.getRoute,
    //                 navigatorKey: navigatorKey,
    //                 theme: getApplicationTheme(),
    //               );
    //             },
    //           );
    //         },
    //       );
    //     }),
    //     providers: [
    //       BlocProvider<ApplicationBloc>.value(
    //         value: ApplicationBloc()..add(ApplicationStartedEvent(context)),
    //       ),
    //     ],
    //   ),
    // );
  }

}

