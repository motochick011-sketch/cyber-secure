// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GeneralData {

 bool get online;
/// Create a copy of GeneralData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralDataCopyWith<GeneralData> get copyWith => _$GeneralDataCopyWithImpl<GeneralData>(this as GeneralData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as GeneralData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralData&&(identical(other.online, _this.online) || other.online == _this.online));
}


@override
int get hashCode {
  final _this = this as GeneralData;
  return Object.hash(runtimeType,_this.online);
}

@override
String toString() {
  final _this = this as GeneralData;
  return 'GeneralData(online: ${_this.online})';
}


}

/// @nodoc
abstract mixin class $GeneralDataCopyWith<$Res>  {
  factory $GeneralDataCopyWith(GeneralData value, $Res Function(GeneralData) _then) = _$GeneralDataCopyWithImpl;
@useResult
$Res call({
 bool online
});




}
/// @nodoc
class _$GeneralDataCopyWithImpl<$Res>
    implements $GeneralDataCopyWith<$Res> {
  _$GeneralDataCopyWithImpl(this._self, this._then);

  final GeneralData _self;
  final $Res Function(GeneralData) _then;

/// Create a copy of GeneralData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? online = null,}) {
  return _then(GeneralData(
online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneralData].
extension GeneralDataPatterns on GeneralData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneralData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneralData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneralData value)  $default,){
final _that = this;
switch (_that) {
case _GeneralData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneralData value)?  $default,){
final _that = this;
switch (_that) {
case _GeneralData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool online)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneralData() when $default != null:
return $default(_that.online);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool online)  $default,) {final _that = this;
switch (_that) {
case _GeneralData():
return $default(_that.online);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool online)?  $default,) {final _that = this;
switch (_that) {
case _GeneralData() when $default != null:
return $default(_that.online);case _:
  return null;

}
}

}

/// @nodoc


class _GeneralData implements GeneralData {
  const _GeneralData({this.online = true});
  

@override@JsonKey() final  bool online;

/// Create a copy of GeneralData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralDataCopyWith<_GeneralData> get copyWith => __$GeneralDataCopyWithImpl<_GeneralData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralData&&(identical(other.online, online) || other.online == online));
}


@override
int get hashCode {
    return Object.hash(runtimeType,online);
}

@override
String toString() {
    return 'GeneralData(online: $online)';
}


}

/// @nodoc
abstract mixin class _$GeneralDataCopyWith<$Res> implements $GeneralDataCopyWith<$Res> {
  factory _$GeneralDataCopyWith(_GeneralData value, $Res Function(_GeneralData) _then) = __$GeneralDataCopyWithImpl;
@override @useResult
$Res call({
 bool online
});




}
/// @nodoc
class __$GeneralDataCopyWithImpl<$Res>
    implements _$GeneralDataCopyWith<$Res> {
  __$GeneralDataCopyWithImpl(this._self, this._then);

  final _GeneralData _self;
  final $Res Function(_GeneralData) _then;

/// Create a copy of GeneralData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? online = null,}) {
  return _then(_GeneralData(
online: null == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
