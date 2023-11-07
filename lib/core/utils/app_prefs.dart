import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../resources/langauge_manager.dart';
import '../resources/utils.dart';


const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";

const String PREFS_KEY_ONBOARDING_SCREEN_SHOWE =
    "PREFS_KEY_ONBOARDING_SCREEN_SHOWED";

const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_IS_USER_TOKEN = "PREFS_KEY_IS_USER_TOKEN";


class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // storeToken(String token) {
  //   _sharedPreferences.setString(TOKEN, token);
  //   print('access token is========================$token');
  // }

  getToken() {
    return _sharedPreferences.getString(TOKEN) ?? '';
  }

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ARABIC.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ENGLISH.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    //_sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
    int count = _sharedPreferences.getInt(PREFS_KEY_ONBOARDING_SCREEN_SHOWE) ?? 0;
    count <1 ? _sharedPreferences.setInt(PREFS_KEY_ONBOARDING_SCREEN_SHOWE, count+1): 0;
  }

  Future<bool> isOnBoardingScreenViewed() async {
    int count =  _sharedPreferences.getInt(PREFS_KEY_ONBOARDING_SCREEN_SHOWE) ?? 0;
    return count > 0 ? true : false ;
  }

  //login

  Future<void> setUserLoggedIn(token) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
    print('userlogged $token');
    _sharedPreferences.setString(PREFS_KEY_IS_USER_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return await _sharedPreferences.getString(PREFS_KEY_IS_USER_TOKEN) ?? '';
  }

  Future<void> persistToken(String token) async {
    await _sharedPreferences.setString(KEY_TOKEN, token);
    return;
  }

  // Future<void> persistUserDataLogin(LoginEntity profile) async {
  //   final profileJson = jsonEncode(profile.toJson());
  //   await _sharedPreferences.setString(USER_DATA_LOGIN, profileJson);
  //   return;
  // }
  //
  // Future<LoginEntity?>? get cachedUserData async {
  //   if (await hasToken) {
  //     var profileJson =  _sharedPreferences.getString(USER_DATA_LOGIN);
  //     var profile = LoginEntity.fromJson(jsonDecode(profileJson!));
  //     return profile.toEntity();
  //   }
  //   return null;
  // }

  Future<String?>? get authToken async {
    return _sharedPreferences.getString(KEY_TOKEN);
  }

  Future<bool> get hasToken async {
    final token = _sharedPreferences.getString(KEY_TOKEN);
    if (token != null && token.isNotEmpty) return true;
    return false;
  }

  Future<String> getCurrentLanguage() async {
    var lang = _sharedPreferences.getString(KEY_LANG);
    if (lang == null || lang.isEmpty) {
      await _sharedPreferences.setString(KEY_LANG, LANG_AR);
      lang = LANG_AR;

    }
    return lang;
  }

  Future<void> logout() async {
    await this.deleteToken();
    await this.deleteProfile();
    await setOnBorading(false);

  }

  Future<void> deleteToken() async {
    await _sharedPreferences.remove(KEY_TOKEN);
    await _sharedPreferences.remove(TOKEN);
    return;
  }

  Future<bool> deleteProfile() async {
    return _sharedPreferences.remove(USER_DATA_LOGIN);
  }

  Future<bool> setLanguage(String language) async {
    utils.setLang(language);
    // Persist the new language.
    await _sharedPreferences.setString(KEY_LANG, language);
    return true;
  }

  Future<String> getLanguage() async {
    var lang = _sharedPreferences.getString(KEY_LANG);
    if (lang == null || lang.isEmpty) {
      await _sharedPreferences.setString(KEY_LANG, LANG_AR);
      lang = LANG_AR;
    }
    return lang;
  }

  Future<void> setSocialEmails(email) async{
     List<String> emails =  _sharedPreferences.getStringList(KEY_SOCIAL_ACOOUNTS) ?? [];
     emails.add(email);
    _sharedPreferences.setStringList(KEY_SOCIAL_ACOOUNTS, emails);
  }

  Future<List<String>> getSocialAccounts() async{
   return  _sharedPreferences.getStringList(KEY_SOCIAL_ACOOUNTS) ?? [];
  }

  Future<void> setOnBorading(bool isVisited) async{
    _sharedPreferences.setBool(KEY_ON_BOARDING, isVisited);
  }

  Future<bool> getOnBorading()async {
   return  _sharedPreferences.getBool(KEY_ON_BOARDING) ?? false;
  }

  saveUser(String text, String text2) {
    var value = {"phone": text, "password": text2};
    return _sharedPreferences.setString(KEY_REMEMBER, json.encode(value));
  }


  Future<Map<String, dynamic>> getUser() async {
    String value = _sharedPreferences.getString(KEY_REMEMBER) ?? '{}';
    return json.decode(value);
  }

  removeUser() {
    return _sharedPreferences.remove(KEY_REMEMBER);
  }

  void persistUserId(int i, String? picture)  async {
    _sharedPreferences.setInt(USER_ID, i);
    _sharedPreferences.setString(KEY_PICTURE, picture!);
  }

  void persistUserData(String loginEntity)  async {
    _sharedPreferences.setString(USER_ID, loginEntity);
    //_sharedPreferences.setString(KEY_PICTURE, picture!);
  }

  Future<String> getUserData()  async {
    String data = _sharedPreferences.getString(USER_ID) ?? "";
    //   String data ='{id:1, name: lorem ipsum, address: dolor set amet}';
    //   print("data : $data");
    //  // var encodedString = jsonEncode(data);
    //
    //   Map<String, dynamic> valueMap = json.decode(data);
    //
    //   return LoginEntity.fromJson(valueMap);
    //_sharedPreferences.setString(KEY_PICTURE, picture!);
    return data;
  }
}
