// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuizData {

 QuizCategory? get selectedCategory; List<Quiz> get quizzes; List<Quiz> get categoryQuizzes; Quiz? get activeQuiz; int get currentIndex; Map<int, int> get selectedAnswers; QuizResult? get result;
/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizDataCopyWith<QuizData> get copyWith => _$QuizDataCopyWithImpl<QuizData>(this as QuizData, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as QuizData;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizData&&(identical(other.selectedCategory, _this.selectedCategory) || other.selectedCategory == _this.selectedCategory)&&const DeepCollectionEquality().equals(other.quizzes, _this.quizzes)&&const DeepCollectionEquality().equals(other.categoryQuizzes, _this.categoryQuizzes)&&(identical(other.activeQuiz, _this.activeQuiz) || other.activeQuiz == _this.activeQuiz)&&(identical(other.currentIndex, _this.currentIndex) || other.currentIndex == _this.currentIndex)&&const DeepCollectionEquality().equals(other.selectedAnswers, _this.selectedAnswers)&&(identical(other.result, _this.result) || other.result == _this.result));
}


@override
int get hashCode {
  final _this = this as QuizData;
  return Object.hash(runtimeType,_this.selectedCategory,const DeepCollectionEquality().hash(_this.quizzes),const DeepCollectionEquality().hash(_this.categoryQuizzes),_this.activeQuiz,_this.currentIndex,const DeepCollectionEquality().hash(_this.selectedAnswers),_this.result);
}

@override
String toString() {
  final _this = this as QuizData;
  return 'QuizData(selectedCategory: ${_this.selectedCategory}, quizzes: ${_this.quizzes}, categoryQuizzes: ${_this.categoryQuizzes}, activeQuiz: ${_this.activeQuiz}, currentIndex: ${_this.currentIndex}, selectedAnswers: ${_this.selectedAnswers}, result: ${_this.result})';
}


}

/// @nodoc
abstract mixin class $QuizDataCopyWith<$Res>  {
  factory $QuizDataCopyWith(QuizData value, $Res Function(QuizData) _then) = _$QuizDataCopyWithImpl;
@useResult
$Res call({
 QuizCategory? selectedCategory, List<Quiz> quizzes, List<Quiz> categoryQuizzes, Quiz? activeQuiz, int currentIndex, Map<int, int> selectedAnswers, QuizResult? result
});


$QuizCopyWith<$Res>? get activeQuiz;$QuizResultCopyWith<$Res>? get result;

}
/// @nodoc
class _$QuizDataCopyWithImpl<$Res>
    implements $QuizDataCopyWith<$Res> {
  _$QuizDataCopyWithImpl(this._self, this._then);

  final QuizData _self;
  final $Res Function(QuizData) _then;

/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategory = freezed,Object? quizzes = null,Object? categoryQuizzes = null,Object? activeQuiz = freezed,Object? currentIndex = null,Object? selectedAnswers = null,Object? result = freezed,}) {
  return _then(QuizData(
selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as QuizCategory?,quizzes: null == quizzes ? _self.quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,categoryQuizzes: null == categoryQuizzes ? _self.categoryQuizzes : categoryQuizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,activeQuiz: freezed == activeQuiz ? _self.activeQuiz : activeQuiz // ignore: cast_nullable_to_non_nullable
as Quiz?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswers: null == selectedAnswers ? _self.selectedAnswers : selectedAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as QuizResult?,
  ));
}
/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizCopyWith<$Res>? get activeQuiz {
    if (_self.activeQuiz == null) {
    return null;
  }

  return $QuizCopyWith<$Res>(_self.activeQuiz!, (value) {
    return _then(_self.copyWith(activeQuiz: value));
  });
}/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $QuizResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [QuizData].
extension QuizDataPatterns on QuizData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizData value)  $default,){
final _that = this;
switch (_that) {
case _QuizData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizData value)?  $default,){
final _that = this;
switch (_that) {
case _QuizData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QuizCategory? selectedCategory,  List<Quiz> quizzes,  List<Quiz> categoryQuizzes,  Quiz? activeQuiz,  int currentIndex,  Map<int, int> selectedAnswers,  QuizResult? result)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizData() when $default != null:
return $default(_that.selectedCategory,_that.quizzes,_that.categoryQuizzes,_that.activeQuiz,_that.currentIndex,_that.selectedAnswers,_that.result);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QuizCategory? selectedCategory,  List<Quiz> quizzes,  List<Quiz> categoryQuizzes,  Quiz? activeQuiz,  int currentIndex,  Map<int, int> selectedAnswers,  QuizResult? result)  $default,) {final _that = this;
switch (_that) {
case _QuizData():
return $default(_that.selectedCategory,_that.quizzes,_that.categoryQuizzes,_that.activeQuiz,_that.currentIndex,_that.selectedAnswers,_that.result);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QuizCategory? selectedCategory,  List<Quiz> quizzes,  List<Quiz> categoryQuizzes,  Quiz? activeQuiz,  int currentIndex,  Map<int, int> selectedAnswers,  QuizResult? result)?  $default,) {final _that = this;
switch (_that) {
case _QuizData() when $default != null:
return $default(_that.selectedCategory,_that.quizzes,_that.categoryQuizzes,_that.activeQuiz,_that.currentIndex,_that.selectedAnswers,_that.result);case _:
  return null;

}
}

}

/// @nodoc


class _QuizData implements QuizData {
  const _QuizData({this.selectedCategory,  List<Quiz> quizzes = const [],  List<Quiz> categoryQuizzes = const [], this.activeQuiz, this.currentIndex = 0,  Map<int, int> selectedAnswers = const {}, this.result}): _quizzes = quizzes,_categoryQuizzes = categoryQuizzes,_selectedAnswers = selectedAnswers;
  

@override final  QuizCategory? selectedCategory;
 final  List<Quiz> _quizzes;
@override@JsonKey() List<Quiz> get quizzes {
  if (_quizzes is EqualUnmodifiableListView) return _quizzes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizzes);
}

 final  List<Quiz> _categoryQuizzes;
@override@JsonKey() List<Quiz> get categoryQuizzes {
  if (_categoryQuizzes is EqualUnmodifiableListView) return _categoryQuizzes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categoryQuizzes);
}

@override final  Quiz? activeQuiz;
@override@JsonKey() final  int currentIndex;
 final  Map<int, int> _selectedAnswers;
@override@JsonKey() Map<int, int> get selectedAnswers {
  if (_selectedAnswers is EqualUnmodifiableMapView) return _selectedAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_selectedAnswers);
}

@override final  QuizResult? result;

/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizDataCopyWith<_QuizData> get copyWith => __$QuizDataCopyWithImpl<_QuizData>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizData&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&const DeepCollectionEquality().equals(other.quizzes, _quizzes)&&const DeepCollectionEquality().equals(other.categoryQuizzes, _categoryQuizzes)&&(identical(other.activeQuiz, activeQuiz) || other.activeQuiz == activeQuiz)&&(identical(other.currentIndex, currentIndex) || other.currentIndex == currentIndex)&&const DeepCollectionEquality().equals(other.selectedAnswers, _selectedAnswers)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,selectedCategory,const DeepCollectionEquality().hash(_quizzes),const DeepCollectionEquality().hash(_categoryQuizzes),activeQuiz,currentIndex,const DeepCollectionEquality().hash(_selectedAnswers),result);
}

@override
String toString() {
    return 'QuizData(selectedCategory: $selectedCategory, quizzes: $quizzes, categoryQuizzes: $categoryQuizzes, activeQuiz: $activeQuiz, currentIndex: $currentIndex, selectedAnswers: $selectedAnswers, result: $result)';
}


}

/// @nodoc
abstract mixin class _$QuizDataCopyWith<$Res> implements $QuizDataCopyWith<$Res> {
  factory _$QuizDataCopyWith(_QuizData value, $Res Function(_QuizData) _then) = __$QuizDataCopyWithImpl;
@override @useResult
$Res call({
 QuizCategory? selectedCategory, List<Quiz> quizzes, List<Quiz> categoryQuizzes, Quiz? activeQuiz, int currentIndex, Map<int, int> selectedAnswers, QuizResult? result
});


@override $QuizCopyWith<$Res>? get activeQuiz;@override $QuizResultCopyWith<$Res>? get result;

}
/// @nodoc
class __$QuizDataCopyWithImpl<$Res>
    implements _$QuizDataCopyWith<$Res> {
  __$QuizDataCopyWithImpl(this._self, this._then);

  final _QuizData _self;
  final $Res Function(_QuizData) _then;

/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCategory = freezed,Object? quizzes = null,Object? categoryQuizzes = null,Object? activeQuiz = freezed,Object? currentIndex = null,Object? selectedAnswers = null,Object? result = freezed,}) {
  return _then(_QuizData(
selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as QuizCategory?,quizzes: null == quizzes ? _self._quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,categoryQuizzes: null == categoryQuizzes ? _self._categoryQuizzes : categoryQuizzes // ignore: cast_nullable_to_non_nullable
as List<Quiz>,activeQuiz: freezed == activeQuiz ? _self.activeQuiz : activeQuiz // ignore: cast_nullable_to_non_nullable
as Quiz?,currentIndex: null == currentIndex ? _self.currentIndex : currentIndex // ignore: cast_nullable_to_non_nullable
as int,selectedAnswers: null == selectedAnswers ? _self._selectedAnswers : selectedAnswers // ignore: cast_nullable_to_non_nullable
as Map<int, int>,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as QuizResult?,
  ));
}

/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizCopyWith<$Res>? get activeQuiz {
    if (_self.activeQuiz == null) {
    return null;
  }

  return $QuizCopyWith<$Res>(_self.activeQuiz!, (value) {
    return _then(_self.copyWith(activeQuiz: value));
  });
}/// Create a copy of QuizData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuizResultCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $QuizResultCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
