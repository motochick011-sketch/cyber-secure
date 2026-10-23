// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PreferencesData {

 ThemeMode get mode; Locale get locale; AppThemeData get theme;
/// Create a copy of PreferencesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesDataCopyWith<PreferencesData> get copyWith => _$PreferencesDataCopyWithImpl<PreferencesData>(this as PreferencesData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PreferencesData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesData&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.theme, _this.theme) || other.theme == _this.theme));
}


@override
int get hashCode {
  final _this = this as PreferencesData;
  return Object.hash(runtimeType,_this.mode,_this.locale,_this.theme);
}

@override
String toString() {
  final _this = this as PreferencesData;
  return 'PreferencesData(mode: ${_this.mode}, locale: ${_this.locale}, theme: ${_this.theme})';
}


}

/// @nodoc
abstract mixin class $PreferencesDataCopyWith<$Res>  {
  factory $PreferencesDataCopyWith(PreferencesData value, $Res Function(PreferencesData) _then) = _$PreferencesDataCopyWithImpl;
@useResult
$Res call({
 ThemeMode mode, Locale locale, AppThemeData theme
});




}
/// @nodoc
class _$PreferencesDataCopyWithImpl<$Res>
    implements $PreferencesDataCopyWith<$Res> {
  _$PreferencesDataCopyWithImpl(this._self, this._then);

  final PreferencesData _self;
  final $Res Function(PreferencesData) _then;

/// Create a copy of PreferencesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? locale = null,Object? theme = null,}) {
  return _then(PreferencesData(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppThemeData,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferencesData].
extension PreferencesDataPatterns on PreferencesData {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferencesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferencesData() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferencesData value)  $default,){
final _that = this;
switch (_that) {
case _PreferencesData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferencesData value)?  $default,){
final _that = this;
switch (_that) {
case _PreferencesData() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ThemeMode mode,  Locale locale,  AppThemeData theme)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferencesData() when $default != null:
return $default(_that.mode,_that.locale,_that.theme);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ThemeMode mode,  Locale locale,  AppThemeData theme)  $default,) {final _that = this;
switch (_that) {
case _PreferencesData():
return $default(_that.mode,_that.locale,_that.theme);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ThemeMode mode,  Locale locale,  AppThemeData theme)?  $default,) {final _that = this;
switch (_that) {
case _PreferencesData() when $default != null:
return $default(_that.mode,_that.locale,_that.theme);case _:
  return null;

}
}

}

/// @nodoc


class _PreferencesData implements PreferencesData {
  const _PreferencesData({required this.mode, required this.locale, required this.theme});
  

@override final  ThemeMode mode;
@override final  Locale locale;
@override final  AppThemeData theme;

/// Create a copy of PreferencesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesDataCopyWith<_PreferencesData> get copyWith => __$PreferencesDataCopyWithImpl<_PreferencesData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferencesData&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.theme, theme) || other.theme == theme));
}


@override
int get hashCode {
    return Object.hash(runtimeType,mode,locale,theme);
}

@override
String toString() {
    return 'PreferencesData(mode: $mode, locale: $locale, theme: $theme)';
}


}

/// @nodoc
abstract mixin class _$PreferencesDataCopyWith<$Res> implements $PreferencesDataCopyWith<$Res> {
  factory _$PreferencesDataCopyWith(_PreferencesData value, $Res Function(_PreferencesData) _then) = __$PreferencesDataCopyWithImpl;
@override @useResult
$Res call({
 ThemeMode mode, Locale locale, AppThemeData theme
});




}
/// @nodoc
class __$PreferencesDataCopyWithImpl<$Res>
    implements _$PreferencesDataCopyWith<$Res> {
  __$PreferencesDataCopyWithImpl(this._self, this._then);

  final _PreferencesData _self;
  final $Res Function(_PreferencesData) _then;

/// Create a copy of PreferencesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? locale = null,Object? theme = null,}) {
  return _then(_PreferencesData(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppThemeData,
  ));
}


}

// dart format on
