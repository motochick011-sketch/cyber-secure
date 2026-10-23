// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SecurityData {

 bool get pinEnabled; bool get biometricEnabled; bool get unlocked;
/// Create a copy of SecurityData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SecurityDataCopyWith<SecurityData> get copyWith => _$SecurityDataCopyWithImpl<SecurityData>(this as SecurityData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SecurityData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SecurityData&&(identical(other.pinEnabled, _this.pinEnabled) || other.pinEnabled == _this.pinEnabled)&&(identical(other.biometricEnabled, _this.biometricEnabled) || other.biometricEnabled == _this.biometricEnabled)&&(identical(other.unlocked, _this.unlocked) || other.unlocked == _this.unlocked));
}


@override
int get hashCode {
  final _this = this as SecurityData;
  return Object.hash(runtimeType,_this.pinEnabled,_this.biometricEnabled,_this.unlocked);
}

@override
String toString() {
  final _this = this as SecurityData;
  return 'SecurityData(pinEnabled: ${_this.pinEnabled}, biometricEnabled: ${_this.biometricEnabled}, unlocked: ${_this.unlocked})';
}


}

/// @nodoc
abstract mixin class $SecurityDataCopyWith<$Res>  {
  factory $SecurityDataCopyWith(SecurityData value, $Res Function(SecurityData) _then) = _$SecurityDataCopyWithImpl;
@useResult
$Res call({
 bool pinEnabled, bool biometricEnabled, bool unlocked
});




}
/// @nodoc
class _$SecurityDataCopyWithImpl<$Res>
    implements $SecurityDataCopyWith<$Res> {
  _$SecurityDataCopyWithImpl(this._self, this._then);

  final SecurityData _self;
  final $Res Function(SecurityData) _then;

/// Create a copy of SecurityData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pinEnabled = null,Object? biometricEnabled = null,Object? unlocked = null,}) {
  return _then(SecurityData(
pinEnabled: null == pinEnabled ? _self.pinEnabled : pinEnabled // ignore: cast_nullable_to_non_nullable
as bool,biometricEnabled: null == biometricEnabled ? _self.biometricEnabled : biometricEnabled // ignore: cast_nullable_to_non_nullable
as bool,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SecurityData].
extension SecurityDataPatterns on SecurityData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SecurityData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SecurityData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SecurityData value)  $default,){
final _that = this;
switch (_that) {
case _SecurityData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SecurityData value)?  $default,){
final _that = this;
switch (_that) {
case _SecurityData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool pinEnabled,  bool biometricEnabled,  bool unlocked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SecurityData() when $default != null:
return $default(_that.pinEnabled,_that.biometricEnabled,_that.unlocked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool pinEnabled,  bool biometricEnabled,  bool unlocked)  $default,) {final _that = this;
switch (_that) {
case _SecurityData():
return $default(_that.pinEnabled,_that.biometricEnabled,_that.unlocked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool pinEnabled,  bool biometricEnabled,  bool unlocked)?  $default,) {final _that = this;
switch (_that) {
case _SecurityData() when $default != null:
return $default(_that.pinEnabled,_that.biometricEnabled,_that.unlocked);case _:
  return null;

}
}

}

/// @nodoc


class _SecurityData implements SecurityData {
  const _SecurityData({this.pinEnabled = false, this.biometricEnabled = false, this.unlocked = false});
  

@override@JsonKey() final  bool pinEnabled;
@override@JsonKey() final  bool biometricEnabled;
@override@JsonKey() final  bool unlocked;

/// Create a copy of SecurityData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SecurityDataCopyWith<_SecurityData> get copyWith => __$SecurityDataCopyWithImpl<_SecurityData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SecurityData&&(identical(other.pinEnabled, pinEnabled) || other.pinEnabled == pinEnabled)&&(identical(other.biometricEnabled, biometricEnabled) || other.biometricEnabled == biometricEnabled)&&(identical(other.unlocked, unlocked) || other.unlocked == unlocked));
}


@override
int get hashCode {
    return Object.hash(runtimeType,pinEnabled,biometricEnabled,unlocked);
}

@override
String toString() {
    return 'SecurityData(pinEnabled: $pinEnabled, biometricEnabled: $biometricEnabled, unlocked: $unlocked)';
}


}

/// @nodoc
abstract mixin class _$SecurityDataCopyWith<$Res> implements $SecurityDataCopyWith<$Res> {
  factory _$SecurityDataCopyWith(_SecurityData value, $Res Function(_SecurityData) _then) = __$SecurityDataCopyWithImpl;
@override @useResult
$Res call({
 bool pinEnabled, bool biometricEnabled, bool unlocked
});




}
/// @nodoc
class __$SecurityDataCopyWithImpl<$Res>
    implements _$SecurityDataCopyWith<$Res> {
  __$SecurityDataCopyWithImpl(this._self, this._then);

  final _SecurityData _self;
  final $Res Function(_SecurityData) _then;

/// Create a copy of SecurityData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pinEnabled = null,Object? biometricEnabled = null,Object? unlocked = null,}) {
  return _then(_SecurityData(
pinEnabled: null == pinEnabled ? _self.pinEnabled : pinEnabled // ignore: cast_nullable_to_non_nullable
as bool,biometricEnabled: null == biometricEnabled ? _self.biometricEnabled : biometricEnabled // ignore: cast_nullable_to_non_nullable
as bool,unlocked: null == unlocked ? _self.unlocked : unlocked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
