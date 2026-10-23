// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_learning_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserLearningStatus {

 int get lessonsCompleted; int get totalLessons; int get quizzesCompleted; int get quizzesPassed; int get totalQuizzes;
/// Create a copy of UserLearningStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLearningStatusCopyWith<UserLearningStatus> get copyWith => _$UserLearningStatusCopyWithImpl<UserLearningStatus>(this as UserLearningStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserLearningStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLearningStatus&&(identical(other.lessonsCompleted, _this.lessonsCompleted) || other.lessonsCompleted == _this.lessonsCompleted)&&(identical(other.totalLessons, _this.totalLessons) || other.totalLessons == _this.totalLessons)&&(identical(other.quizzesCompleted, _this.quizzesCompleted) || other.quizzesCompleted == _this.quizzesCompleted)&&(identical(other.quizzesPassed, _this.quizzesPassed) || other.quizzesPassed == _this.quizzesPassed)&&(identical(other.totalQuizzes, _this.totalQuizzes) || other.totalQuizzes == _this.totalQuizzes));
}


@override
int get hashCode {
  final _this = this as UserLearningStatus;
  return Object.hash(runtimeType,_this.lessonsCompleted,_this.totalLessons,_this.quizzesCompleted,_this.quizzesPassed,_this.totalQuizzes);
}

@override
String toString() {
  final _this = this as UserLearningStatus;
  return 'UserLearningStatus(lessonsCompleted: ${_this.lessonsCompleted}, totalLessons: ${_this.totalLessons}, quizzesCompleted: ${_this.quizzesCompleted}, quizzesPassed: ${_this.quizzesPassed}, totalQuizzes: ${_this.totalQuizzes})';
}


}

/// @nodoc
abstract mixin class $UserLearningStatusCopyWith<$Res>  {
  factory $UserLearningStatusCopyWith(UserLearningStatus value, $Res Function(UserLearningStatus) _then) = _$UserLearningStatusCopyWithImpl;
@useResult
$Res call({
 int lessonsCompleted, int totalLessons, int quizzesCompleted, int quizzesPassed, int totalQuizzes
});




}
/// @nodoc
class _$UserLearningStatusCopyWithImpl<$Res>
    implements $UserLearningStatusCopyWith<$Res> {
  _$UserLearningStatusCopyWithImpl(this._self, this._then);

  final UserLearningStatus _self;
  final $Res Function(UserLearningStatus) _then;

/// Create a copy of UserLearningStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lessonsCompleted = null,Object? totalLessons = null,Object? quizzesCompleted = null,Object? quizzesPassed = null,Object? totalQuizzes = null,}) {
  return _then(UserLearningStatus(
lessonsCompleted: null == lessonsCompleted ? _self.lessonsCompleted : lessonsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalLessons: null == totalLessons ? _self.totalLessons : totalLessons // ignore: cast_nullable_to_non_nullable
as int,quizzesCompleted: null == quizzesCompleted ? _self.quizzesCompleted : quizzesCompleted // ignore: cast_nullable_to_non_nullable
as int,quizzesPassed: null == quizzesPassed ? _self.quizzesPassed : quizzesPassed // ignore: cast_nullable_to_non_nullable
as int,totalQuizzes: null == totalQuizzes ? _self.totalQuizzes : totalQuizzes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLearningStatus].
extension UserLearningStatusPatterns on UserLearningStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLearningStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLearningStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLearningStatus value)  $default,){
final _that = this;
switch (_that) {
case _UserLearningStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLearningStatus value)?  $default,){
final _that = this;
switch (_that) {
case _UserLearningStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int lessonsCompleted,  int totalLessons,  int quizzesCompleted,  int quizzesPassed,  int totalQuizzes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLearningStatus() when $default != null:
return $default(_that.lessonsCompleted,_that.totalLessons,_that.quizzesCompleted,_that.quizzesPassed,_that.totalQuizzes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int lessonsCompleted,  int totalLessons,  int quizzesCompleted,  int quizzesPassed,  int totalQuizzes)  $default,) {final _that = this;
switch (_that) {
case _UserLearningStatus():
return $default(_that.lessonsCompleted,_that.totalLessons,_that.quizzesCompleted,_that.quizzesPassed,_that.totalQuizzes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int lessonsCompleted,  int totalLessons,  int quizzesCompleted,  int quizzesPassed,  int totalQuizzes)?  $default,) {final _that = this;
switch (_that) {
case _UserLearningStatus() when $default != null:
return $default(_that.lessonsCompleted,_that.totalLessons,_that.quizzesCompleted,_that.quizzesPassed,_that.totalQuizzes);case _:
  return null;

}
}

}

/// @nodoc


class _UserLearningStatus implements UserLearningStatus {
  const _UserLearningStatus({required this.lessonsCompleted, required this.totalLessons, required this.quizzesCompleted, required this.quizzesPassed, required this.totalQuizzes});
  

@override final  int lessonsCompleted;
@override final  int totalLessons;
@override final  int quizzesCompleted;
@override final  int quizzesPassed;
@override final  int totalQuizzes;

/// Create a copy of UserLearningStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLearningStatusCopyWith<_UserLearningStatus> get copyWith => __$UserLearningStatusCopyWithImpl<_UserLearningStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLearningStatus&&(identical(other.lessonsCompleted, lessonsCompleted) || other.lessonsCompleted == lessonsCompleted)&&(identical(other.totalLessons, totalLessons) || other.totalLessons == totalLessons)&&(identical(other.quizzesCompleted, quizzesCompleted) || other.quizzesCompleted == quizzesCompleted)&&(identical(other.quizzesPassed, quizzesPassed) || other.quizzesPassed == quizzesPassed)&&(identical(other.totalQuizzes, totalQuizzes) || other.totalQuizzes == totalQuizzes));
}


@override
int get hashCode {
    return Object.hash(runtimeType,lessonsCompleted,totalLessons,quizzesCompleted,quizzesPassed,totalQuizzes);
}

@override
String toString() {
    return 'UserLearningStatus(lessonsCompleted: $lessonsCompleted, totalLessons: $totalLessons, quizzesCompleted: $quizzesCompleted, quizzesPassed: $quizzesPassed, totalQuizzes: $totalQuizzes)';
}


}

/// @nodoc
abstract mixin class _$UserLearningStatusCopyWith<$Res> implements $UserLearningStatusCopyWith<$Res> {
  factory _$UserLearningStatusCopyWith(_UserLearningStatus value, $Res Function(_UserLearningStatus) _then) = __$UserLearningStatusCopyWithImpl;
@override @useResult
$Res call({
 int lessonsCompleted, int totalLessons, int quizzesCompleted, int quizzesPassed, int totalQuizzes
});




}
/// @nodoc
class __$UserLearningStatusCopyWithImpl<$Res>
    implements _$UserLearningStatusCopyWith<$Res> {
  __$UserLearningStatusCopyWithImpl(this._self, this._then);

  final _UserLearningStatus _self;
  final $Res Function(_UserLearningStatus) _then;

/// Create a copy of UserLearningStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessonsCompleted = null,Object? totalLessons = null,Object? quizzesCompleted = null,Object? quizzesPassed = null,Object? totalQuizzes = null,}) {
  return _then(_UserLearningStatus(
lessonsCompleted: null == lessonsCompleted ? _self.lessonsCompleted : lessonsCompleted // ignore: cast_nullable_to_non_nullable
as int,totalLessons: null == totalLessons ? _self.totalLessons : totalLessons // ignore: cast_nullable_to_non_nullable
as int,quizzesCompleted: null == quizzesCompleted ? _self.quizzesCompleted : quizzesCompleted // ignore: cast_nullable_to_non_nullable
as int,quizzesPassed: null == quizzesPassed ? _self.quizzesPassed : quizzesPassed // ignore: cast_nullable_to_non_nullable
as int,totalQuizzes: null == totalQuizzes ? _self.totalQuizzes : totalQuizzes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
