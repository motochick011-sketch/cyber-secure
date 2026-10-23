// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LessonBlock {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LessonBlock);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LessonBlock()';
}


}

/// @nodoc
class $LessonBlockCopyWith<$Res>  {
$LessonBlockCopyWith(LessonBlock _, $Res Function(LessonBlock) __);
}


/// Adds pattern-matching-related methods to [LessonBlock].
extension LessonBlockPatterns on LessonBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ParagraphBlock value)?  paragraph,TResult Function( BulletsBlock value)?  bullets,TResult Function( StepsBlock value)?  steps,TResult Function( CalloutBlock value)?  callout,TResult Function( CompareBlock value)?  compare,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ParagraphBlock() when paragraph != null:
return paragraph(_that);case BulletsBlock() when bullets != null:
return bullets(_that);case StepsBlock() when steps != null:
return steps(_that);case CalloutBlock() when callout != null:
return callout(_that);case CompareBlock() when compare != null:
return compare(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ParagraphBlock value)  paragraph,required TResult Function( BulletsBlock value)  bullets,required TResult Function( StepsBlock value)  steps,required TResult Function( CalloutBlock value)  callout,required TResult Function( CompareBlock value)  compare,}){
final _that = this;
switch (_that) {
case ParagraphBlock():
return paragraph(_that);case BulletsBlock():
return bullets(_that);case StepsBlock():
return steps(_that);case CalloutBlock():
return callout(_that);case CompareBlock():
return compare(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ParagraphBlock value)?  paragraph,TResult? Function( BulletsBlock value)?  bullets,TResult? Function( StepsBlock value)?  steps,TResult? Function( CalloutBlock value)?  callout,TResult? Function( CompareBlock value)?  compare,}){
final _that = this;
switch (_that) {
case ParagraphBlock() when paragraph != null:
return paragraph(_that);case BulletsBlock() when bullets != null:
return bullets(_that);case StepsBlock() when steps != null:
return steps(_that);case CalloutBlock() when callout != null:
return callout(_that);case CompareBlock() when compare != null:
return compare(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  paragraph,TResult Function( String? heading,  List<String> items)?  bullets,TResult Function( String? heading,  List<LessonStep> steps)?  steps,TResult Function( String? heading,  String text,  CalloutStyle style)?  callout,TResult Function( String leftLabel,  String leftValue,  String rightLabel,  String rightValue)?  compare,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ParagraphBlock() when paragraph != null:
return paragraph(_that.text);case BulletsBlock() when bullets != null:
return bullets(_that.heading,_that.items);case StepsBlock() when steps != null:
return steps(_that.heading,_that.steps);case CalloutBlock() when callout != null:
return callout(_that.heading,_that.text,_that.style);case CompareBlock() when compare != null:
return compare(_that.leftLabel,_that.leftValue,_that.rightLabel,_that.rightValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  paragraph,required TResult Function( String? heading,  List<String> items)  bullets,required TResult Function( String? heading,  List<LessonStep> steps)  steps,required TResult Function( String? heading,  String text,  CalloutStyle style)  callout,required TResult Function( String leftLabel,  String leftValue,  String rightLabel,  String rightValue)  compare,}) {final _that = this;
switch (_that) {
case ParagraphBlock():
return paragraph(_that.text);case BulletsBlock():
return bullets(_that.heading,_that.items);case StepsBlock():
return steps(_that.heading,_that.steps);case CalloutBlock():
return callout(_that.heading,_that.text,_that.style);case CompareBlock():
return compare(_that.leftLabel,_that.leftValue,_that.rightLabel,_that.rightValue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  paragraph,TResult? Function( String? heading,  List<String> items)?  bullets,TResult? Function( String? heading,  List<LessonStep> steps)?  steps,TResult? Function( String? heading,  String text,  CalloutStyle style)?  callout,TResult? Function( String leftLabel,  String leftValue,  String rightLabel,  String rightValue)?  compare,}) {final _that = this;
switch (_that) {
case ParagraphBlock() when paragraph != null:
return paragraph(_that.text);case BulletsBlock() when bullets != null:
return bullets(_that.heading,_that.items);case StepsBlock() when steps != null:
return steps(_that.heading,_that.steps);case CalloutBlock() when callout != null:
return callout(_that.heading,_that.text,_that.style);case CompareBlock() when compare != null:
return compare(_that.leftLabel,_that.leftValue,_that.rightLabel,_that.rightValue);case _:
  return null;

}
}

}

/// @nodoc


class ParagraphBlock implements LessonBlock {
  const ParagraphBlock({required this.text});
  

 final  String text;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParagraphBlockCopyWith<ParagraphBlock> get copyWith => _$ParagraphBlockCopyWithImpl<ParagraphBlock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ParagraphBlock&&(identical(other.text, text) || other.text == text));
}


@override
int get hashCode {
    return Object.hash(runtimeType,text);
}

@override
String toString() {
    return 'LessonBlock.paragraph(text: $text)';
}


}

/// @nodoc
abstract mixin class $ParagraphBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $ParagraphBlockCopyWith(ParagraphBlock value, $Res Function(ParagraphBlock) _then) = _$ParagraphBlockCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$ParagraphBlockCopyWithImpl<$Res>
    implements $ParagraphBlockCopyWith<$Res> {
  _$ParagraphBlockCopyWithImpl(this._self, this._then);

  final ParagraphBlock _self;
  final $Res Function(ParagraphBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(ParagraphBlock(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BulletsBlock implements LessonBlock {
  const BulletsBlock({this.heading, required  List<String> items}): _items = items;
  

 final  String? heading;
 final  List<String> _items;
 List<String> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BulletsBlockCopyWith<BulletsBlock> get copyWith => _$BulletsBlockCopyWithImpl<BulletsBlock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is BulletsBlock&&(identical(other.heading, heading) || other.heading == heading)&&const DeepCollectionEquality().equals(other.items, _items));
}


@override
int get hashCode {
    return Object.hash(runtimeType,heading,const DeepCollectionEquality().hash(_items));
}

@override
String toString() {
    return 'LessonBlock.bullets(heading: $heading, items: $items)';
}


}

/// @nodoc
abstract mixin class $BulletsBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $BulletsBlockCopyWith(BulletsBlock value, $Res Function(BulletsBlock) _then) = _$BulletsBlockCopyWithImpl;
@useResult
$Res call({
 String? heading, List<String> items
});




}
/// @nodoc
class _$BulletsBlockCopyWithImpl<$Res>
    implements $BulletsBlockCopyWith<$Res> {
  _$BulletsBlockCopyWithImpl(this._self, this._then);

  final BulletsBlock _self;
  final $Res Function(BulletsBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? heading = freezed,Object? items = null,}) {
  return _then(BulletsBlock(
heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class StepsBlock implements LessonBlock {
  const StepsBlock({this.heading, required  List<LessonStep> steps}): _steps = steps;
  

 final  String? heading;
 final  List<LessonStep> _steps;
 List<LessonStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}


/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepsBlockCopyWith<StepsBlock> get copyWith => _$StepsBlockCopyWithImpl<StepsBlock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is StepsBlock&&(identical(other.heading, heading) || other.heading == heading)&&const DeepCollectionEquality().equals(other.steps, _steps));
}


@override
int get hashCode {
    return Object.hash(runtimeType,heading,const DeepCollectionEquality().hash(_steps));
}

@override
String toString() {
    return 'LessonBlock.steps(heading: $heading, steps: $steps)';
}


}

/// @nodoc
abstract mixin class $StepsBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $StepsBlockCopyWith(StepsBlock value, $Res Function(StepsBlock) _then) = _$StepsBlockCopyWithImpl;
@useResult
$Res call({
 String? heading, List<LessonStep> steps
});




}
/// @nodoc
class _$StepsBlockCopyWithImpl<$Res>
    implements $StepsBlockCopyWith<$Res> {
  _$StepsBlockCopyWithImpl(this._self, this._then);

  final StepsBlock _self;
  final $Res Function(StepsBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? heading = freezed,Object? steps = null,}) {
  return _then(StepsBlock(
heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String?,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<LessonStep>,
  ));
}


}

/// @nodoc


class CalloutBlock implements LessonBlock {
  const CalloutBlock({this.heading, required this.text, this.style = CalloutStyle.neutral});
  

 final  String? heading;
 final  String text;
@JsonKey() final  CalloutStyle style;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalloutBlockCopyWith<CalloutBlock> get copyWith => _$CalloutBlockCopyWithImpl<CalloutBlock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CalloutBlock&&(identical(other.heading, heading) || other.heading == heading)&&(identical(other.text, text) || other.text == text)&&(identical(other.style, style) || other.style == style));
}


@override
int get hashCode {
    return Object.hash(runtimeType,heading,text,style);
}

@override
String toString() {
    return 'LessonBlock.callout(heading: $heading, text: $text, style: $style)';
}


}

/// @nodoc
abstract mixin class $CalloutBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $CalloutBlockCopyWith(CalloutBlock value, $Res Function(CalloutBlock) _then) = _$CalloutBlockCopyWithImpl;
@useResult
$Res call({
 String? heading, String text, CalloutStyle style
});




}
/// @nodoc
class _$CalloutBlockCopyWithImpl<$Res>
    implements $CalloutBlockCopyWith<$Res> {
  _$CalloutBlockCopyWithImpl(this._self, this._then);

  final CalloutBlock _self;
  final $Res Function(CalloutBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? heading = freezed,Object? text = null,Object? style = null,}) {
  return _then(CalloutBlock(
heading: freezed == heading ? _self.heading : heading // ignore: cast_nullable_to_non_nullable
as String?,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as CalloutStyle,
  ));
}


}

/// @nodoc


class CompareBlock implements LessonBlock {
  const CompareBlock({required this.leftLabel, required this.leftValue, required this.rightLabel, required this.rightValue});
  

 final  String leftLabel;
 final  String leftValue;
 final  String rightLabel;
 final  String rightValue;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CompareBlockCopyWith<CompareBlock> get copyWith => _$CompareBlockCopyWithImpl<CompareBlock>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CompareBlock&&(identical(other.leftLabel, leftLabel) || other.leftLabel == leftLabel)&&(identical(other.leftValue, leftValue) || other.leftValue == leftValue)&&(identical(other.rightLabel, rightLabel) || other.rightLabel == rightLabel)&&(identical(other.rightValue, rightValue) || other.rightValue == rightValue));
}


@override
int get hashCode {
    return Object.hash(runtimeType,leftLabel,leftValue,rightLabel,rightValue);
}

@override
String toString() {
    return 'LessonBlock.compare(leftLabel: $leftLabel, leftValue: $leftValue, rightLabel: $rightLabel, rightValue: $rightValue)';
}


}

/// @nodoc
abstract mixin class $CompareBlockCopyWith<$Res> implements $LessonBlockCopyWith<$Res> {
  factory $CompareBlockCopyWith(CompareBlock value, $Res Function(CompareBlock) _then) = _$CompareBlockCopyWithImpl;
@useResult
$Res call({
 String leftLabel, String leftValue, String rightLabel, String rightValue
});




}
/// @nodoc
class _$CompareBlockCopyWithImpl<$Res>
    implements $CompareBlockCopyWith<$Res> {
  _$CompareBlockCopyWithImpl(this._self, this._then);

  final CompareBlock _self;
  final $Res Function(CompareBlock) _then;

/// Create a copy of LessonBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? leftLabel = null,Object? leftValue = null,Object? rightLabel = null,Object? rightValue = null,}) {
  return _then(CompareBlock(
leftLabel: null == leftLabel ? _self.leftLabel : leftLabel // ignore: cast_nullable_to_non_nullable
as String,leftValue: null == leftValue ? _self.leftValue : leftValue // ignore: cast_nullable_to_non_nullable
as String,rightLabel: null == rightLabel ? _self.rightLabel : rightLabel // ignore: cast_nullable_to_non_nullable
as String,rightValue: null == rightValue ? _self.rightValue : rightValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
