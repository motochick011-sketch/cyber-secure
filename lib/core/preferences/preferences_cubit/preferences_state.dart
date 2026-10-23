import 'dart:ui';

import 'package:flutter/material.dart' show ThemeMode;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../design_system/theme/app_theme_data.dart';
import '../../cubit/view_state.dart';

part 'preferences_state.freezed.dart';

@freezed
abstract class PreferencesData with _$PreferencesData {
  const factory PreferencesData({required ThemeMode mode, required Locale locale, required AppThemeData theme}) = _PreferencesData;
}

typedef PreferencesState = ViewState<PreferencesData>;
