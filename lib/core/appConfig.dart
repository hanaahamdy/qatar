import 'dart:io';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ehsan_1/core/resources/utils.dart';
import 'package:ehsan_1/core/ui/widgets/general_widgets/error_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants.dart';
import 'errors/base_error.dart';
import 'errors/connection_error.dart';
import 'errors/custom_error.dart';
import 'errors/forbidden_error.dart';
import 'errors/internal_server_error.dart';
import 'errors/unauthorized_error.dart';

typedef void LocaleChangeCallback(Locale locale);

class AppConfig {
  // Supported languages.
  final supportedLanguages = [LANG_AR, LANG_EN];

  // Supported locales
  Iterable<Locale> get supportedLocales => supportedLanguages.map(
        (language) => Locale(language, ''),
      );

  // Function() to be invoked when changing the working language
  late LocaleChangeCallback onLocaleChanged;

  Future<String> get currentLanguage async {
    final prefs = await SharedPreferences.getInstance();
    var lang = prefs.getString(KEY_LANG);
    if (lang == null || lang.isEmpty) {
      await prefs.setString(KEY_LANG, LANG_AR);
      lang = LANG_AR;
    }
    return lang;
  }

  Future<void> setLanguage(String lang) async {
    if (await currentLanguage == lang) return;

    utils.setLang(lang);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(KEY_LANG, lang);
    this.onLocaleChanged(Locale(lang, ''));
  }

  Future<void> setArabicLanguage() async {
    await setLanguage(LANG_AR);
  }

  Future<void> setEnglishLanguage() async {
    await setLanguage(LANG_EN);
  }

  bool notNullOrEmpty(String? value) {
    return value != null && value.isNotEmpty;
  }

  // showToast({
  //   required String msg,
  //   Toast? toastLength,
  //   Color? backgroundColor,
  //   Color? textColor,
  // }) {
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: toastLength,
  //       backgroundColor: backgroundColor,
  //       textColor: textColor,
  //   );
  // }

  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  showError({
    required BaseError error,
    required BuildContext context,
    required ScaffoldState scaffoldState,
    required callback,
  }) {
    if (error is ConnectionError) {
      ErrorViewer.showConnectionError(
        context,
        callback,
        scaffoldState: scaffoldState,
      );
    } else if (error is CustomError) {
      ErrorViewer.showCustomError(
        context,
        error.message,
        //      callback,
        scaffoldState: scaffoldState,
      );
    } else if (error is UnauthorizedHttpError) {
      ErrorViewer.showCustomError(
        context,
        error.message,
        //      callback,
        scaffoldState: scaffoldState,
      );
    } else if (error is ForbiddenError) {
      ErrorViewer.showCustomError(
        context,
        error.message,
        //      callback,
        scaffoldState: scaffoldState,
      );
    } else if (error is InternalServerError) {
      ErrorViewer.showCustomError(
        context,
        error.message,
        //      callback,
        scaffoldState: scaffoldState,
      );
    } else {
      print(error);
      ErrorViewer.showUnexpectedError(
        context,
        scaffoldState: scaffoldState,
      );
    }
  }

}

AppConfig appConfig = AppConfig();
