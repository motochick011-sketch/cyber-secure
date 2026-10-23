// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'learn_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LearnData {

 List<Lesson> get lessons; List<Lesson> get categoryLessons; QuizCategory? get selectedCategory; Lesson? get activeLesson; int get currentIndex;
/// Create a copy of LearnData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearnDataCopyWith<LearnData> get copyWith => _$LearnDataCopyWithImpl<LearnData>(this as LearnData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LearnData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearnData&&const DeepCollectionEquality().equals(other.lessons, _this.lessons)&&const DeepCollectionEquality().equals(other.categoryLessons, _this.categoryLessons)&&(identical(other.selectedCategory, _this.selectedCategory) || other.selectedCategory == _this.selectedCategory)&&(identical(other.activeLesson, _this.activeLesson) || other.activeLesson == _this.activeLesson)&&(identical(other.currentIndex, _this.currentIndex) || other.currentIndex == _this.currentIndex));
}


@override
int get hashCode {
  final _this = this as LearnData;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.lessons),const DeepCollectionEquality().hash(_this.categoryLessons),_this.selectedCategory,_this.activeLesson,_this.currentIndex);
}

@override
String toString() {
  final _this = this as LearnData;
  return 'LearnData(lessons: ${_this.lessons}, categoryLessons: ${_this.categoryLessons}, selectedCategory: ${_this.selectedCategory}, activeLesson: ${_this.activeLesson}, currentIndex: ${_this.currentIndex})';
}


}

/// @nodoc
abstract mixin class $LearnDataCopyWith<$Res>  {
  factory $LearnDataCopyWith(LearnData value, $Res Function(LearnData) _then) = _$LearnDataCopyWithImpl;
@useResult
$Res call({
 List<Lesson> lessons, List<Lesson> categoryLessons, QuizCategory? selectedCategory, Lesson? activeLesson, int currentIndex
});


$LessonCopyWith<$Res>? get activeLesson;

}
/// @nodoc
class _$LearnDataCopyWithImpl<$Res>
    implements $LearnDataCopyWith<$Res> {
  _$LearnDataCopyWithImpl(this._self, this._then);

  final LearnData _self;
  final $Res Function(LearnData) _then;

/// Create a copy of LearnData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lessons = null,Object? categoryLessons = null,Object? selectedCategory = freezed,Object? activeLesson = freezed,Object? currentIndex = null,}) {
  return _then(LearnData(
lessons: null == lessons ? _self.lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,categoryLessons: null == categoryLessons ? _self.categoryLessons : categoryLessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as QuizCategory?,activeLesson: freezed == activeLesson ? _self.activeLesson : activeLesson // ignore: cast_nullable_to_non_nullable
as Lesson?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of LearnData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonCopyWith<$Res>? get activeLesson {
    if (_self.activeLesson == null) {
    return null;
  }

  return $LessonCopyWith<$Res>(_self.activeLesson!, (value) {
    return _then(_self.copyWith(activeLesson: value));
  });
}
}


/// Adds pattern-matching-related methods to [LearnData].
extension LearnDataPatterns on LearnData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearnData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearnData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearnData value)  $default,){
final _that = this;
switch (_that) {
case _LearnData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearnData value)?  $default,){
final _that = this;
switch (_that) {
case _LearnData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Lesson> lessons,  List<Lesson> categoryLessons,  QuizCategory? selectedCategory,  Lesson? activeLesson,  int currentIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearnData() when $default != null:
return $default(_that.lessons,_that.categoryLessons,_that.selectedCategory,_that.activeLesson,_that.currentIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Lesson> lessons,  List<Lesson> categoryLessons,  QuizCategory? selectedCategory,  Lesson? activeLesson,  int currentIndex)  $default,) {final _that = this;
switch (_that) {
case _LearnData():
return $default(_that.lessons,_that.categoryLessons,_that.selectedCategory,_that.activeLesson,_that.currentIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Lesson> lessons,  List<Lesson> categoryLessons,  QuizCategory? selectedCategory,  Lesson? activeLesson,  int currentIndex)?  $default,) {final _that = this;
switch (_that) {
case _LearnData() when $default != null:
return $default(_that.lessons,_that.categoryLessons,_that.selectedCategory,_that.activeLesson,_that.currentIndex);case _:
  return null;

}
}

}

/// @nodoc


class _LearnData implements LearnData {
  const _LearnData({ List<Lesson> lessons = const [],  List<Lesson> categoryLessons = const [], this.selectedCategory, this.activeLesson, this.currentIndex = 0}): _lessons = lessons,_categoryLessons = categoryLessons;
  

 final  List<Lesson> _lessons;
@override@JsonKey() List<Lesson> get lessons {
  if (_lessons is EqualUnmodifiableListView) return _lessons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lessons);
}

 final  List<Lesson> _categoryLessons;
@override@JsonKey() List<Lesson> get categoryLessons {
  if (_categoryLessons is EqualUnmodifiableListView) return _categoryLessons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryLessons);
}

@override final  QuizCategory? selectedCategory;
@override final  Lesson? activeLesson;
@override@JsonKey() final  int currentIndex;

/// Create a copy of LearnData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearnDataCopyWith<_LearnData> get copyWith => __$LearnDataCopyWithImpl<_LearnData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearnData&&const DeepCollectionEquality().equals(other.lessons, _lessons)&&const DeepCollectionEquality().equals(other.categoryLessons, _categoryLessons)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.activeLesson, activeLesson) || other.activeLesson == activeLesson)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_lessons),const DeepCollectionEquality().hash(_categoryLessons),selectedCategory,activeLesson,currentIndex);
}

@override
String toString() {
    return 'LearnData(lessons: $lessons, categoryLessons: $categoryLessons, selectedCategory: $selectedCategory, activeLesson: $activeLesson, currentIndex: $currentIndex)';
}


}

/// @nodoc
abstract mixin class _$LearnDataCopyWith<$Res> implements $LearnDataCopyWith<$Res> {
  factory _$LearnDataCopyWith(_LearnData value, $Res Function(_LearnData) _then) = __$LearnDataCopyWithImpl;
@override @useResult
$Res call({
 List<Lesson> lessons, List<Lesson> categoryLessons, QuizCategory? selectedCategory, Lesson? activeLesson, int currentIndex
});


@override $LessonCopyWith<$Res>? get activeLesson;

}
/// @nodoc
class __$LearnDataCopyWithImpl<$Res>
    implements _$LearnDataCopyWith<$Res> {
  __$LearnDataCopyWithImpl(this._self, this._then);

  final _LearnData _self;
  final $Res Function(_LearnData) _then;

/// Create a copy of LearnData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lessons = null,Object? categoryLessons = null,Object? selectedCategory = freezed,Object? activeLesson = freezed,Object? currentIndex = null,}) {
  return _then(_LearnData(
lessons: null == lessons ? _self._lessons : lessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,categoryLessons: null == categoryLessons ? _self._categoryLessons : categoryLessons // ignore: cast_nullable_to_non_nullable
as List<Lesson>,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as QuizCategory?,activeLesson: freezed == activeLesson ? _self.activeLesson : activeLesson // ignore: cast_nullable_to_non_nullable
as Lesson?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of LearnData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LessonCopyWith<$Res>? get activeLesson {
    if (_self.activeLesson == null) {
    return null;
  }

  return $LessonCopyWith<$Res>(_self.activeLesson!, (value) {
    return _then(_self.copyWith(activeLesson: value));
  });
}
}

// dart format on
