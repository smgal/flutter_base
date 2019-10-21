import 'dart:async';
import 'dart:convert'; // for json.decode()

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LocaleManager {
  Locale locale;
  Map<String, dynamic> _data;

  LocaleManager(this.locale);

  static LocaleManager of(BuildContext context) {
    return Localizations.of<LocaleManager>(context, LocaleManager);
  }

  Future<bool> load() async {
    // TODO: 디폴트 lang으로 fallbak 가능하도록
    // default JSON을 읽은 후 langs JSON으로 덮어 쓰는 방식
    var defaultJsonPath = 'assets/strings/values.json';

    var langJsonPath = 'assets/strings/values_${this.locale.languageCode}.json';

    this._data = json.decode(await rootBundle.loadString(langJsonPath));

    return true;
  }

  String getString(String key) {
    return (key != null && key.isNotEmpty && this._data[key] != null) ? this._data[key] : key;
  }
}

class LocaleDelegate extends LocalizationsDelegate<LocaleManager> {
  const LocaleDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ko'].contains(locale.languageCode);

  @override
  Future<LocaleManager> load(Locale locale) async {
    LocaleManager localeManager = new LocaleManager(locale);
    await localeManager.load();
    return localeManager;
  }

  @override
  bool shouldReload(LocaleDelegate old) => false;
}
