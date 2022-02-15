import 'package:flutter/material.dart';

class L10n {
  static final locales = [Locale('es'), Locale('en')];

  static String getFlag(String code) {
    switch (code) {
      case "es":
        return "image";
      case "en":
        return "image";

      default:
        return "image";
    }
  }
}
