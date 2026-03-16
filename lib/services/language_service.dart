import 'dart:convert';
import 'package:flutter/services.dart';

class LanguageService {

  static Map<String, String> _localizedStrings = {};
  static String currentLanguage = "en";

  static Future<void> loadLanguage(String languageCode) async {
    currentLanguage = languageCode;

    String jsonString =
        await rootBundle.loadString('assets/lang/$languageCode.json');

    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  static String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}