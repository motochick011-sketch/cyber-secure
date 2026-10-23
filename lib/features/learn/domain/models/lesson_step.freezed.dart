// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonStep {

 String get title; String get text;
/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LessonStepCopyWith<LessonStep> get copyWith => _$LessonStepCopyWithImpl<LessonStep>(this as LessonStep, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LessonStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonStep&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.text, _this.text) || other.text == _this.text));
}


@override
int get hashCode {
  final _this = this as LessonStep;
  return Object.hash(runtimeType,_this.title,_this.text);
}

@override
String toString() {
  final _this = this as LessonStep;
  return 'LessonStep(title: ${_this.title}, text: ${_this.text})';
}


}

/// @nodoc
abstract mixin class $LessonStepCopyWith<$Res>  {
  factory $LessonStepCopyWith(LessonStep value, $Res Function(LessonStep) _then) = _$LessonStepCopyWithImpl;
@useResult
$Res call({
 String title, String text
});




}
/// @nodoc
class _$LessonStepCopyWithImpl<$Res>
    implements $LessonStepCopyWith<$Res> {
  _$LessonStepCopyWithImpl(this._self, this._then);

  final LessonStep _self;
  final $Res Function(LessonStep) _then;

/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? text = null,}) {
  return _then(LessonStep(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LessonStep].
extension LessonStepPatterns on LessonStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LessonStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LessonStep value)  $default,){
final _that = this;
switch (_that) {
case _LessonStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LessonStep value)?  $default,){
final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String text)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
return $default(_that.title,_that.text);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String text)  $default,) {final _that = this;
switch (_that) {
case _LessonStep():
return $default(_that.title,_that.text);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String text)?  $default,) {final _that = this;
switch (_that) {
case _LessonStep() when $default != null:
return $default(_that.title,_that.text);case _:
  return null;

}
}

}

/// @nodoc


class _LessonStep implements LessonStep {
  const _LessonStep({required this.title, required this.text});
  

@override final  String title;
@override final  String text;

/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LessonStepCopyWith<_LessonStep> get copyWith => __$LessonStepCopyWithImpl<_LessonStep>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LessonStep&&(identical(other.title, title) || other.title == title)&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,title,text);
}

@override
String toString() {
    return 'LessonStep(title: $title, text: $text)';
}


}

/// @nodoc
abstract mixin class _$LessonStepCopyWith<$Res> implements $LessonStepCopyWith<$Res> {
  factory _$LessonStepCopyWith(_LessonStep value, $Res Function(_LessonStep) _then) = __$LessonStepCopyWithImpl;
@override @useResult
$Res call({
 String title, String text
});




}
/// @nodoc
class __$LessonStepCopyWithImpl<$Res>
    implements _$LessonStepCopyWith<$Res> {
  __$LessonStepCopyWithImpl(this._self, this._then);

  final _LessonStep _self;
  final $Res Function(_LessonStep) _then;

/// Create a copy of LessonStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? text = null,}) {
  return _then(_LessonStep(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
