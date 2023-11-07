import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../database/db.dart';
import '../di/di.dart';
import '../resources/utils.dart';
import '../utils/app_prefs.dart';
import 'application_events.dart';
import 'application_state.dart';

//NotificationsService notificationsService = NotificationsService();

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  // Indicates if the application is initialized or not.
  var _isInitialized = false;

  final _supportedLanguages = [LANG_AR, LANG_EN];

  ApplicationBloc() : super(ApplicationState.initialState);

  // Supported locales
  Iterable<Locale> get supportedLocales => _supportedLanguages.map(
        (language) => Locale(language, ''),
      );

  @override
  ApplicationState get initialState => ApplicationState.initialState;

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is ApplicationStartedEvent) {
      final newState = await _handleApplicationStartedEvent(event);
      if (newState != null) yield newState;
    }
    if (event is SetApplicationLanguageEvent) {
      yield await _handleSetApplicationLanguageEvent(event);
    }

/*    if (event is SetProfileSplashEvent) {
      yield await _handleSetPRofileSpalshEvent(event.profileEntity);
    }*/
    // if (event is SetUserDataLoginEvent) {
    //   yield await _handleSetUserProfileEvent();
    // }
    if (event is UserLogoutEvent) {
      // yield await _handleUserLogoutEvent(event.context);
    }
    if (event is GetFCMTokenAndUpdateItEvent) {
      //getFCMTokenAndUpdateIt();
      yield state;
    }
  }

  // Future<ApplicationState> _handleSetPRofileSpalshEvent(
  //     LoginEntity? profileEntity) async {
  //   return state.copyWith(loginEntity: profileEntity);
  // }
  //
  // Future<ApplicationState> _handleSetUserProfileEvent() async {
  //   final userData = await locator<AppPreferences>().cachedUserData;
  //   return state.copyWith(loginEntity: userData);
  // }

  Future<ApplicationState?> _handleApplicationStartedEvent(
    ApplicationStartedEvent event,
  ) async {
    // If we already started the app -> stop.
    if (_isInitialized) return null;

    // Init DB for caching.
    //await AppDB.init();

    // Init language.
    final language = await locator<AppPreferences>().getCurrentLanguage();

    // Init user profile.

    _isInitialized = true;

    return ApplicationState(
      language: language,
    );
  }

  Future<ApplicationState> _handleSetApplicationLanguageEvent(
      SetApplicationLanguageEvent event) async {
    switch (event.language) {
      case LANG_AR:
        // If the language is already arabic -> don't change anything.
        if (state.language == LANG_AR) return state;

        final setLanguageResult =
            await locator<AppPreferences>().setLanguage(LANG_AR);
        if (setLanguageResult) {
          return state.copyWith(language: LANG_AR);
        }

        return state;
      case LANG_EN:
        // If the language is already english -> don't change anything.
        if (state.language == LANG_EN) return state;

        final setLanguageResult =
            await locator<AppPreferences>().setLanguage(LANG_EN);
        if (setLanguageResult) {
          return state.copyWith(language: LANG_EN);
        }

        return state;
    }
    return state;
  }

  // Future<ApplicationState> _handleUserLogoutEvent(BuildContext context) async {
  //   await GetIt.I<ProfileRepository>().logout().whenComplete(() async{
  //     await locator<AppPreferences>().logout();
  //    // Navigator.of(context).pushReplacementNamed(Routes.mainSignRoute);
  //   });
  //   return state.clearProfile();
  // }

  //
  // getFCMTokenAndUpdateIt() async {
  //   await _configureFCM();
  // }

  // Future<void> _configureFCM() async {
  //   firebaseMessaging.requestPermission(
  //     sound: true,
  //     badge: true,
  //     alert: true,
  //     provisional: true,
  //     announcement: true,
  //     carPlay: true,
  //     criticalAlert: false,
  //   );
  //
  //   if (Platform.isIOS)
  //     firebaseMessaging.setForegroundNotificationPresentationOptions(
  //       alert: true,
  //       badge: true,
  //       sound: true,
  //     );
  //
  //   // await _configureFCMToken();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     RemoteNotification? _notification = message.notification;
  //     // TODO :
  //     // AndroidNotification? _android = message.notification?.android;
  //     print('omar is $message');
  //     if (_notification != null) {
  //       final title = _notification.title;
  //       final body = _notification.body;
  //       final payload = jsonEncode(message.data);
  //       notificationsService.showNotification(
  //           title ?? 'Title', body ?? 'Body', payload);
  //     }
  //
  //
  //   });
  //
  // }

  bool get isInitialized => _isInitialized;
}



