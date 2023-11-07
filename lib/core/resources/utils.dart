import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  String _lang = 'ar';

  static RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  static String Function(Match) mathFunc = (Match match) => '${match[1]},';

  static String formatNumber(double number) {
    return number.round().toString().replaceAllMapped(reg, mathFunc);
  }

  static formatBytes(bytes, decimals) {
    if (bytes == 0) return 0.0;
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }

  void setLang(String lang) {
    _lang = lang;
    print('---------------------Lang--------------:$_lang');
  }

  String getLang() {
    return _lang;
  }

  double setWidthPercentage(percentage, context) {
    if (percentage <= 100 || percentage > 0)
      return MediaQuery.of(context).size.width * (percentage / 100);
    else
      return MediaQuery.of(context).size.width;
  }

  double setHeightPercentage(percentage, context) {
    if (percentage <= 100 || percentage > 0)
      return MediaQuery.of(context).size.height * (percentage / 100);
    else
      return MediaQuery.of(context).size.height;
  }
}

Utils utils = Utils();
