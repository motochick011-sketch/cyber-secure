// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewState<T> {

 T get data; Status get status; AppError? get error; CubitEffect? get effect;
/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewStateCopyWith<T, ViewState<T>> get copyWith => _$ViewStateCopyWithImpl<T, ViewState<T>>(this as ViewState<T>, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ViewState<T>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewState<T>&&const DeepCollectionEquality().equals(other.data, _this.data)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.error, _this.error) || other.error == _this.error)&&(identical(other.effect, _this.effect) || other.effect == _this.effect));
}


@override
int get hashCode {
  final _this = this as ViewState<T>;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.data),_this.status,_this.error,_this.effect);
}

@override
String toString() {
  final _this = this as ViewState<T>;
  return 'ViewState<$T>(data: ${_this.data}, status: ${_this.status}, error: ${_this.error}, effect: ${_this.effect})';
}


}

/// @nodoc
abstract mixin class $ViewStateCopyWith<T,$Res>  {
  factory $ViewStateCopyWith(ViewState<T> value, $Res Function(ViewState<T>) _then) = _$ViewStateCopyWithImpl;
@useResult
$Res call({
 T data, Status status, AppError? error, CubitEffect? effect
});


$AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class _$ViewStateCopyWithImpl<T,$Res>
    implements $ViewStateCopyWith<T, $Res> {
  _$ViewStateCopyWithImpl(this._self, this._then);

  final ViewState<T> _self;
  final $Res Function(ViewState<T>) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? status = null,Object? error = freezed,Object? effect = freezed,}) {
  return _then(ViewState(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as CubitEffect?,
  ));
}
/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [ViewState].
extension ViewStatePatterns<T> on ViewState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ViewState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ViewState<T> value)  $default,){
final _that = this;
switch (_that) {
case _ViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ViewState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( T data,  Status status,  AppError? error,  CubitEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ViewState() when $default != null:
return $default(_that.data,_that.status,_that.error,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( T data,  Status status,  AppError? error,  CubitEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ViewState():
return $default(_that.data,_that.status,_that.error,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( T data,  Status status,  AppError? error,  CubitEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ViewState() when $default != null:
return $default(_that.data,_that.status,_that.error,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ViewState<T> implements ViewState<T> {
  const _ViewState({required this.data, this.status = Status.initial, this.error, this.effect});
  

@override final  T data;
@override@JsonKey() final  Status status;
@override final  AppError? error;
@override final  CubitEffect? effect;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ViewStateCopyWith<T, _ViewState<T>> get copyWith => __$ViewStateCopyWithImpl<T, _ViewState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ViewState<T>&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(data),status,error,effect);
}

@override
String toString() {
    return 'ViewState<$T>(data: $data, status: $status, error: $error, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ViewStateCopyWith<T,$Res> implements $ViewStateCopyWith<T, $Res> {
  factory _$ViewStateCopyWith(_ViewState<T> value, $Res Function(_ViewState<T>) _then) = __$ViewStateCopyWithImpl;
@override @useResult
$Res call({
 T data, Status status, AppError? error, CubitEffect? effect
});


@override $AppErrorCopyWith<$Res>? get error;

}
/// @nodoc
class __$ViewStateCopyWithImpl<T,$Res>
    implements _$ViewStateCopyWith<T, $Res> {
  __$ViewStateCopyWithImpl(this._self, this._then);

  final _ViewState<T> _self;
  final $Res Function(_ViewState<T>) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? status = null,Object? error = freezed,Object? effect = freezed,}) {
  return _then(_ViewState<T>(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppError?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as CubitEffect?,
  ));
}

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppErrorCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $AppErrorCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
