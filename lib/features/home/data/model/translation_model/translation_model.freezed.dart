// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'translation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TranslationModel {

 int get id; String get sourceText; String get translated; String get sourceLang; String get targetLang; DateTime get createdAt; int get timesUsed;
/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TranslationModelCopyWith<TranslationModel> get copyWith => _$TranslationModelCopyWithImpl<TranslationModel>(this as TranslationModel, _$identity);

  /// Serializes this TranslationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TranslationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sourceText, sourceText) || other.sourceText == sourceText)&&(identical(other.translated, translated) || other.translated == translated)&&(identical(other.sourceLang, sourceLang) || other.sourceLang == sourceLang)&&(identical(other.targetLang, targetLang) || other.targetLang == targetLang)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.timesUsed, timesUsed) || other.timesUsed == timesUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sourceText,translated,sourceLang,targetLang,createdAt,timesUsed);

@override
String toString() {
  return 'TranslationModel(id: $id, sourceText: $sourceText, translated: $translated, sourceLang: $sourceLang, targetLang: $targetLang, createdAt: $createdAt, timesUsed: $timesUsed)';
}


}

/// @nodoc
abstract mixin class $TranslationModelCopyWith<$Res>  {
  factory $TranslationModelCopyWith(TranslationModel value, $Res Function(TranslationModel) _then) = _$TranslationModelCopyWithImpl;
@useResult
$Res call({
 int id, String sourceText, String translated, String sourceLang, String targetLang, DateTime createdAt, int timesUsed
});




}
/// @nodoc
class _$TranslationModelCopyWithImpl<$Res>
    implements $TranslationModelCopyWith<$Res> {
  _$TranslationModelCopyWithImpl(this._self, this._then);

  final TranslationModel _self;
  final $Res Function(TranslationModel) _then;

/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sourceText = null,Object? translated = null,Object? sourceLang = null,Object? targetLang = null,Object? createdAt = null,Object? timesUsed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sourceText: null == sourceText ? _self.sourceText : sourceText // ignore: cast_nullable_to_non_nullable
as String,translated: null == translated ? _self.translated : translated // ignore: cast_nullable_to_non_nullable
as String,sourceLang: null == sourceLang ? _self.sourceLang : sourceLang // ignore: cast_nullable_to_non_nullable
as String,targetLang: null == targetLang ? _self.targetLang : targetLang // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,timesUsed: null == timesUsed ? _self.timesUsed : timesUsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TranslationModel].
extension TranslationModelPatterns on TranslationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TranslationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TranslationModel value)  $default,){
final _that = this;
switch (_that) {
case _TranslationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TranslationModel value)?  $default,){
final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sourceText,  String translated,  String sourceLang,  String targetLang,  DateTime createdAt,  int timesUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
return $default(_that.id,_that.sourceText,_that.translated,_that.sourceLang,_that.targetLang,_that.createdAt,_that.timesUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sourceText,  String translated,  String sourceLang,  String targetLang,  DateTime createdAt,  int timesUsed)  $default,) {final _that = this;
switch (_that) {
case _TranslationModel():
return $default(_that.id,_that.sourceText,_that.translated,_that.sourceLang,_that.targetLang,_that.createdAt,_that.timesUsed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sourceText,  String translated,  String sourceLang,  String targetLang,  DateTime createdAt,  int timesUsed)?  $default,) {final _that = this;
switch (_that) {
case _TranslationModel() when $default != null:
return $default(_that.id,_that.sourceText,_that.translated,_that.sourceLang,_that.targetLang,_that.createdAt,_that.timesUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TranslationModel implements TranslationModel {
  const _TranslationModel({required this.id, required this.sourceText, required this.translated, required this.sourceLang, required this.targetLang, required this.createdAt, required this.timesUsed});
  factory _TranslationModel.fromJson(Map<String, dynamic> json) => _$TranslationModelFromJson(json);

@override final  int id;
@override final  String sourceText;
@override final  String translated;
@override final  String sourceLang;
@override final  String targetLang;
@override final  DateTime createdAt;
@override final  int timesUsed;

/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TranslationModelCopyWith<_TranslationModel> get copyWith => __$TranslationModelCopyWithImpl<_TranslationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TranslationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TranslationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sourceText, sourceText) || other.sourceText == sourceText)&&(identical(other.translated, translated) || other.translated == translated)&&(identical(other.sourceLang, sourceLang) || other.sourceLang == sourceLang)&&(identical(other.targetLang, targetLang) || other.targetLang == targetLang)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.timesUsed, timesUsed) || other.timesUsed == timesUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sourceText,translated,sourceLang,targetLang,createdAt,timesUsed);

@override
String toString() {
  return 'TranslationModel(id: $id, sourceText: $sourceText, translated: $translated, sourceLang: $sourceLang, targetLang: $targetLang, createdAt: $createdAt, timesUsed: $timesUsed)';
}


}

/// @nodoc
abstract mixin class _$TranslationModelCopyWith<$Res> implements $TranslationModelCopyWith<$Res> {
  factory _$TranslationModelCopyWith(_TranslationModel value, $Res Function(_TranslationModel) _then) = __$TranslationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String sourceText, String translated, String sourceLang, String targetLang, DateTime createdAt, int timesUsed
});




}
/// @nodoc
class __$TranslationModelCopyWithImpl<$Res>
    implements _$TranslationModelCopyWith<$Res> {
  __$TranslationModelCopyWithImpl(this._self, this._then);

  final _TranslationModel _self;
  final $Res Function(_TranslationModel) _then;

/// Create a copy of TranslationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sourceText = null,Object? translated = null,Object? sourceLang = null,Object? targetLang = null,Object? createdAt = null,Object? timesUsed = null,}) {
  return _then(_TranslationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sourceText: null == sourceText ? _self.sourceText : sourceText // ignore: cast_nullable_to_non_nullable
as String,translated: null == translated ? _self.translated : translated // ignore: cast_nullable_to_non_nullable
as String,sourceLang: null == sourceLang ? _self.sourceLang : sourceLang // ignore: cast_nullable_to_non_nullable
as String,targetLang: null == targetLang ? _self.targetLang : targetLang // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,timesUsed: null == timesUsed ? _self.timesUsed : timesUsed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
