// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class L10n {
  L10n();

  static L10n? _current;

  static L10n get current {
    assert(_current != null,
        'No instance of L10n was loaded. Try to initialize the L10n delegate before accessing L10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<L10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = L10n();
      L10n._current = instance;

      return instance;
    });
  }

  static L10n of(BuildContext context) {
    final instance = L10n.maybeOf(context);
    assert(instance != null,
        'No instance of L10n present in the widget tree. Did you add L10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static L10n? maybeOf(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  /// `РСК Банк`
  String get rsk {
    return Intl.message(
      'РСК Банк',
      name: 'rsk',
      desc: '',
      args: [],
    );
  }

  /// `Больше возможностей`
  String get morePossibilities {
    return Intl.message(
      'Больше возможностей',
      name: 'morePossibilities',
      desc: '',
      args: [],
    );
  }

  /// `Добро пожаловать!`
  String get welcome {
    return Intl.message(
      'Добро пожаловать!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Войти по телефону`
  String get loginByPhone {
    return Intl.message(
      'Войти по телефону',
      name: 'loginByPhone',
      desc: '',
      args: [],
    );
  }

  /// `Запросить Client ID приложения РСКБанк`
  String get requestClientid {
    return Intl.message(
      'Запросить Client ID приложения РСКБанк',
      name: 'requestClientid',
      desc: '',
      args: [],
    );
  }

  /// `Записаться в кассу`
  String get signUpCashier {
    return Intl.message(
      'Записаться в кассу',
      name: 'signUpCashier',
      desc: '',
      args: [],
    );
  }

  /// `Обслуживание в кассе без авторизации`
  String get getServiceTicket {
    return Intl.message(
      'Обслуживание в кассе без авторизации',
      name: 'getServiceTicket',
      desc: '',
      args: [],
    );
  }

  /// `Онлайн очередь:`
  String get onlineQueue {
    return Intl.message(
      'Онлайн очередь:',
      name: 'onlineQueue',
      desc: '',
      args: [],
    );
  }

  /// `удобно`
  String get comfortable {
    return Intl.message(
      'удобно',
      name: 'comfortable',
      desc: '',
      args: [],
    );
  }

  /// `просто`
  String get simply {
    return Intl.message(
      'просто',
      name: 'simply',
      desc: '',
      args: [],
    );
  }

  /// `быстро`
  String get fast {
    return Intl.message(
      'быстро',
      name: 'fast',
      desc: '',
      args: [],
    );
  }

  /// `Выберите язык`
  String get chooseLanguage {
    return Intl.message(
      'Выберите язык',
      name: 'chooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Разрешить приложению 'Очередь онлайн' доступ к учетной записи в РСК Банк`
  String get allowRSKaccess {
    return Intl.message(
      'Разрешить приложению \'Очередь онлайн\' доступ к учетной записи в РСК Банк',
      name: 'allowRSKaccess',
      desc: '',
      args: [],
    );
  }

  /// `Разрешить`
  String get allow {
    return Intl.message(
      'Разрешить',
      name: 'allow',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Введите номер`
  String get enterNumber {
    return Intl.message(
      'Введите номер',
      name: 'enterNumber',
      desc: '',
      args: [],
    );
  }

  /// `Продолжить`
  String get continueWord {
    return Intl.message(
      'Продолжить',
      name: 'continueWord',
      desc: '',
      args: [],
    );
  }

  /// `Согласие на обработку персональных данных`
  String get personalData {
    return Intl.message(
      'Согласие на обработку персональных данных',
      name: 'personalData',
      desc: '',
      args: [],
    );
  }

  /// `Не пришло смс? Запросить повторно через `
  String get requestSMSagain {
    return Intl.message(
      'Не пришло смс? Запросить повторно через ',
      name: 'requestSMSagain',
      desc: '',
      args: [],
    );
  }

  /// `Сообщение с кодом отправлено на номер телефона `
  String get codeSendToPhone {
    return Intl.message(
      'Сообщение с кодом отправлено на номер телефона ',
      name: 'codeSendToPhone',
      desc: '',
      args: [],
    );
  }

  /// `Введите код`
  String get enterCode {
    return Intl.message(
      'Введите код',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Вы ввели неверный код`
  String get enteredInvalidCode {
    return Intl.message(
      'Вы ввели неверный код',
      name: 'enteredInvalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Запросить пароль`
  String get requestPassword {
    return Intl.message(
      'Запросить пароль',
      name: 'requestPassword',
      desc: '',
      args: [],
    );
  }

  /// `Запросить повторно через `
  String get requestAgain {
    return Intl.message(
      'Запросить повторно через ',
      name: 'requestAgain',
      desc: '',
      args: [],
    );
  }

  /// `Пункты обслуживание`
  String get serviceItims {
    return Intl.message(
      'Пункты обслуживание',
      name: 'serviceItims',
      desc: '',
      args: [],
    );
  }

  /// `Карта`
  String get maps {
    return Intl.message(
      'Карта',
      name: 'maps',
      desc: '',
      args: [],
    );
  }

  /// `Список`
  String get listscroll {
    return Intl.message(
      'Список',
      name: 'listscroll',
      desc: '',
      args: [],
    );
  }

  /// `Рядом со мной`
  String get nextTome {
    return Intl.message(
      'Рядом со мной',
      name: 'nextTome',
      desc: '',
      args: [],
    );
  }

  /// `Перерыв`
  String get lunchBreak {
    return Intl.message(
      'Перерыв',
      name: 'lunchBreak',
      desc: '',
      args: [],
    );
  }

  /// `Тип услуги `
  String get serviceType {
    return Intl.message(
      'Тип услуги ',
      name: 'serviceType',
      desc: '',
      args: [],
    );
  }

  /// `Обслуживание юридических лиц`
  String get serviceLegal {
    return Intl.message(
      'Обслуживание юридических лиц',
      name: 'serviceLegal',
      desc: '',
      args: [],
    );
  }

  /// `Обслуживание физических лиц`
  String get serviceIndividuals {
    return Intl.message(
      'Обслуживание физических лиц',
      name: 'serviceIndividuals',
      desc: '',
      args: [],
    );
  }

  /// `Денежные переводы `
  String get moneyTransfers {
    return Intl.message(
      'Денежные переводы ',
      name: 'moneyTransfers',
      desc: '',
      args: [],
    );
  }

  /// `Банковские переводы`
  String get bankTransfers {
    return Intl.message(
      'Банковские переводы',
      name: 'bankTransfers',
      desc: '',
      args: [],
    );
  }

  /// `Выдача карт`
  String get issuanceCards {
    return Intl.message(
      'Выдача карт',
      name: 'issuanceCards',
      desc: '',
      args: [],
    );
  }

  /// `Я льготник`
  String get ibeneficiary {
    return Intl.message(
      'Я льготник',
      name: 'ibeneficiary',
      desc: '',
      args: [],
    );
  }

  /// `Ваш талон успешно создан`
  String get yourTicketCreated {
    return Intl.message(
      'Ваш талон успешно создан',
      name: 'yourTicketCreated',
      desc: '',
      args: [],
    );
  }

  /// `Ваш талон`
  String get yourTicket {
    return Intl.message(
      'Ваш талон',
      name: 'yourTicket',
      desc: '',
      args: [],
    );
  }

  /// `Пожалуйста, распечатайте талон\n на терминале или отсканируйте QR-код`
  String get printTicket {
    return Intl.message(
      'Пожалуйста, распечатайте талон\n на терминале или отсканируйте QR-код',
      name: 'printTicket',
      desc: '',
      args: [],
    );
  }

  /// `Код для активизации  №1122`
  String get codeActivation {
    return Intl.message(
      'Код для активизации  №1122',
      name: 'codeActivation',
      desc: '',
      args: [],
    );
  }

  /// `QR-код`
  String get qrcode {
    return Intl.message(
      'QR-код',
      name: 'qrcode',
      desc: '',
      args: [],
    );
  }

  /// `Используйте камеру для сканирования QR-кода`
  String get useCamera {
    return Intl.message(
      'Используйте камеру для сканирования QR-кода',
      name: 'useCamera',
      desc: '',
      args: [],
    );
  }

  /// `Хотите отменить очередь?`
  String get cancelQueue {
    return Intl.message(
      'Хотите отменить очередь?',
      name: 'cancelQueue',
      desc: '',
      args: [],
    );
  }

  /// `Да`
  String get yes {
    return Intl.message(
      'Да',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Нет`
  String get no {
    return Intl.message(
      'Нет',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Понятно`
  String get ponyatno {
    return Intl.message(
      'Понятно',
      name: 'ponyatno',
      desc: '',
      args: [],
    );
  }

  /// `Получить талон`
  String get getTicket {
    return Intl.message(
      'Получить талон',
      name: 'getTicket',
      desc: '',
      args: [],
    );
  }

  /// `Отсканировать QR-код`
  String get scanQR {
    return Intl.message(
      'Отсканировать QR-код',
      name: 'scanQR',
      desc: '',
      args: [],
    );
  }

  /// `Отменить запись`
  String get cancelEntry {
    return Intl.message(
      'Отменить запись',
      name: 'cancelEntry',
      desc: '',
      args: [],
    );
  }

  /// `Перенести запись`
  String get transferlEntry {
    return Intl.message(
      'Перенести запись',
      name: 'transferlEntry',
      desc: '',
      args: [],
    );
  }

  /// `Время очереди`
  String get queueTime {
    return Intl.message(
      'Время очереди',
      name: 'queueTime',
      desc: '',
      args: [],
    );
  }

  /// `Выберите дату`
  String get selectDate {
    return Intl.message(
      'Выберите дату',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Дата посещения`
  String get dateVisit {
    return Intl.message(
      'Дата посещения',
      name: 'dateVisit',
      desc: '',
      args: [],
    );
  }

  /// `Адрес филиала`
  String get address {
    return Intl.message(
      'Адрес филиала',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `г.Бишкек, ул.Манас 96А`
  String get streetM {
    return Intl.message(
      'г.Бишкек, ул.Манас 96А',
      name: 'streetM',
      desc: '',
      args: [],
    );
  }

  /// `ул. Тоголок Молдо 11`
  String get streetT {
    return Intl.message(
      'ул. Тоголок Молдо 11',
      name: 'streetT',
      desc: '',
      args: [],
    );
  }

  /// `Центральный филиал`
  String get centralBranch {
    return Intl.message(
      'Центральный филиал',
      name: 'centralBranch',
      desc: '',
      args: [],
    );
  }

  /// `Головной офис`
  String get headOffice {
    return Intl.message(
      'Головной офис',
      name: 'headOffice',
      desc: '',
      args: [],
    );
  }

  /// `Закрыто`
  String get closed {
    return Intl.message(
      'Закрыто',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Открыто до 16:00`
  String get openUntil {
    return Intl.message(
      'Открыто до 16:00',
      name: 'openUntil',
      desc: '',
      args: [],
    );
  }

  /// `Просим вас прибыть в банк заранее на 10 минут относительно назначенного времени. При входе в банк вам необходимо на терминале ввести активационный код или отсканировать QR-код.`
  String get whenEnteringBank {
    return Intl.message(
      'Просим вас прибыть в банк заранее на 10 минут относительно назначенного времени. При входе в банк вам необходимо на терминале ввести активационный код или отсканировать QR-код.',
      name: 'whenEnteringBank',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<L10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<L10n> load(Locale locale) => L10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
