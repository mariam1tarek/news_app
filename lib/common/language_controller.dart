import 'package:flutter/material.dart';

class LanguageController {
  LanguageController._();

  static final ValueNotifier<Locale> locale =
      ValueNotifier<Locale>(const Locale('en'));

  static const List<Locale> supportedLocales = [Locale('en'), Locale('ar')];

  static void setLocale(Locale newLocale) {
    locale.value = newLocale;
  }
}
