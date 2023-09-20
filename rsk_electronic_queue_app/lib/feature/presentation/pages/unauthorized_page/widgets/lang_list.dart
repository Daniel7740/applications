import 'package:flutter/material.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';

/// Класс Language представляет информацию о языке, такую как его идентификатор, полное название, код языка, имя и иконка.

class Language {
  final int id; // Идентификатор языка
  final String fullName; // Полное название языка
  final String name; // Имя языка
  final String languageCode; // Код языка
  final Image flag; // Иконка языка

  Language(
    this.id,
    this.fullName,
    this.name,
    this.languageCode,
    this.flag,
  );

// Статический метод для получения списка доступных языков
  static List<Language> languageList() {
    return <Language>[
      Language(0, 'Кыргызча', 'KG', 'ky', AppImages.langKG), // Язык Кыргызча
      Language(1, 'Русский', 'RU', 'ru', AppImages.langRU), // Язык Русский
      Language(2, 'English', 'EN', 'en', AppImages.langEN), // Язык English
    ];
  }
}
