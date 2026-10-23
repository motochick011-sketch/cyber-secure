import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../design_system/theme/app_theme.dart';
import '../../../design_system/theme/app_theme_data.dart';
import '../../../design_system/theme/brand.dart';
import '../../config/app_config.dart';
import '../../cubit/base_cubit.dart';
import '../../cubit/view_state.dart';
import '../../storage/local_store.dart';
import 'preferences_state.dart';

@lazySingleton
class PreferencesCubit extends BaseCubit<PreferencesData> with WidgetsBindingObserver {
  PreferencesCubit(this._store, this._config) : super(_initial(_config.brand, _store)) {
    WidgetsBinding.instance.addObserver(this);
  }

  final LocalStore _store;
  final AppConfig _config;

  AppThemeData get theme => state.data.theme;

  ThemeMode get mode => state.data.mode;

  Locale get locale => state.data.locale;

  Future<void> setMode(ThemeMode mode) async {
    await _store.setThemeMode(mode);
    _rebuild(mode: mode);
  }

  Future<void> toggleBrightness() async {
    final next = switch (mode) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };
    await setMode(next);
  }

  Future<void> setLocale(Locale locale) async {
    await _store.setLocale(locale);
    _rebuild(locale: locale);
  }

  @override
  void didChangePlatformBrightness() {
    if (mode == ThemeMode.system) _rebuild();
  }

  void _rebuild({ThemeMode? mode, Locale? locale}) {
    final m = mode ?? state.data.mode;
    final l = locale ?? state.data.locale;
    emit(
      state.copyWith(
        status: Status.loaded,
        data: state.data.copyWith(mode: m, locale: l, theme: _resolve(m)),
      ),
    );
  }

  AppThemeData _resolve(ThemeMode mode) {
    final brightness = switch (mode) {
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark,
      ThemeMode.system => PlatformDispatcher.instance.platformBrightness,
    };
    return brightness == Brightness.dark ? AppTheme.dark(_config.brand) : AppTheme.light(_config.brand);
  }

  static PreferencesData _initial(Brand brand, LocalStore store) {
    final mode = store.themeMode ?? ThemeMode.system;
    final locale = store.locale ?? const Locale('en');
    final brightness = switch (mode) {
      ThemeMode.dark => Brightness.dark,
      ThemeMode.light => Brightness.light,
      ThemeMode.system => PlatformDispatcher.instance.platformBrightness,
    };
    final theme = brightness == Brightness.dark ? AppTheme.dark(brand) : AppTheme.light(brand);
    return PreferencesData(mode: mode, locale: locale, theme: theme);
  }

  @override
  Future<void> close() {
    WidgetsBinding.instance.removeObserver(this);
    return super.close();
  }
}
