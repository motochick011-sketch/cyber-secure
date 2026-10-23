import 'dart:ui';

import 'package:flutter/material.dart' show ThemeMode;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalStore {
  LocalStore(this._prefs);

  final SharedPreferences _prefs;

  ThemeMode? get themeMode {
    final raw = _prefs.getString(_Keys.themeMode);
    if (raw == null) return null;
    return ThemeMode.values.firstWhere((m) => m.name == raw, orElse: () => ThemeMode.system);
  }

  Future<void> setThemeMode(ThemeMode mode) => _prefs.setString(_Keys.themeMode, mode.name);

  Locale? get locale {
    final code = _prefs.getString(_Keys.locale);
    return code == null ? null : Locale(code);
  }

  Future<void> setLocale(Locale locale) => _prefs.setString(_Keys.locale, locale.languageCode);
}

abstract final class _Keys {
  static const themeMode = 'theme_mode';
  static const locale = 'locale';
}
