import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/di/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider with ChangeNotifier {
  final String savedLocale = sl<SharedPreferences>().getString('lang') ??
      'ru'; // Загрузка сохраненной локали из SharedPreferences или использование значения по умолчанию 'ru'
  late Locale currentLocale = Locale(savedLocale); // Текущая выбранная локаль

  void changeLanguage(int newLanguage) {
    switch (newLanguage) {
      case 1: // Если выбран язык 1 (русский)
        currentLocale = const Locale('ru'); // Установка текущей локали на 'ru'
        sl<SharedPreferences>().setString(
            'lang', 'ru'); // Сохранение выбранного языка в SharedPreferences
        break;
      case 2: // Если выбран язык 2 (английский)
        currentLocale = const Locale('en'); // Установка текущей локали на 'en'
        sl<SharedPreferences>().setString(
            'lang', 'en'); // Сохранение выбранного языка в SharedPreferences
        break;
      default: // Если выбран другой язык (кыргызский)
        currentLocale = const Locale('ky'); // Установка текущей локали на 'ky'
        sl<SharedPreferences>().setString(
            'lang', 'ky'); // Сохранение выбранного языка в SharedPreferences
        break;
    }
    notifyListeners(); // Уведомление слушателей об изменении локали
  }
}
