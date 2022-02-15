import 'dart:math';

import 'package:flutter/material.dart';
import 'package:internacionalizacion/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale get locale => _locale ?? Locale("es");

  void setLocale(Locale locale) {
    if (!L10n.locales.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = null;
    notifyListeners();
  }
}
