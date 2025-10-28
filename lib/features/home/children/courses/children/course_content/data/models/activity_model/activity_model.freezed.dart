// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ActivityModel _$ActivityModelFromJson(
  Map<String, dynamic> json
) {
    return AIReadingModel.fromJson(
      json
    );
}

/// @nodoc
mixin _$ActivityModel {

 int get id; String get title; String get description; DateTime get dueDate; String get content; String get length;// New field
 String get complexity;// New field
 String get style;// New field
 DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityModelCopyWith<ActivityModel> get copyWith => _$ActivityModelCopyWithImpl<ActivityModel>(this as ActivityModel, _$identity);

  /// Serializes this ActivityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.content, content) || other.content == content)&&(identical(other.length, length) || other.length == length)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,content,length,complexity,style,createdAt,updatedAt);

@override
String toString() {
  return 'ActivityModel(id: $id, title: $title, description: $description, dueDate: $dueDate, content: $content, length: $length, complexity: $complexity, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ActivityModelCopyWith<$Res>  {
  factory $ActivityModelCopyWith(ActivityModel value, $Res Function(ActivityModel) _then) = _$ActivityModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, DateTime dueDate, String content, String length, String complexity, String style, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ActivityModelCopyWithImpl<$Res>
    implements $ActivityModelCopyWith<$Res> {
  _$ActivityModelCopyWithImpl(this._self, this._then);

  final ActivityModel _self;
  final $Res Function(ActivityModel) _then;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? content = null,Object? length = null,Object? complexity = null,Object? style = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,complexity: null == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivityModel].
extension ActivityModelPatterns on ActivityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AIReadingModel value)?  aIReading,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AIReadingModel value)  aIReading,}){
final _that = this;
switch (_that) {
case AIReadingModel():
return aIReading(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AIReadingModel value)?  aIReading,}){
final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String title,  String description,  DateTime dueDate,  String content,  String length,  String complexity,  String style,  DateTime createdAt,  DateTime updatedAt)?  aIReading,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that.id,_that.title,_that.description,_that.dueDate,_that.content,_that.length,_that.complexity,_that.style,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String title,  String description,  DateTime dueDate,  String content,  String length,  String complexity,  String style,  DateTime createdAt,  DateTime updatedAt)  aIReading,}) {final _that = this;
switch (_that) {
case AIReadingModel():
return aIReading(_that.id,_that.title,_that.description,_that.dueDate,_that.content,_that.length,_that.complexity,_that.style,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String title,  String description,  DateTime dueDate,  String content,  String length,  String complexity,  String style,  DateTime createdAt,  DateTime updatedAt)?  aIReading,}) {final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that.id,_that.title,_that.description,_that.dueDate,_that.content,_that.length,_that.complexity,_that.style,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AIReadingModel implements ActivityModel {
  const AIReadingModel({required this.id, required this.title, required this.description, required this.dueDate, required this.content, required this.length, required this.complexity, required this.style, required this.createdAt, required this.updatedAt});
  factory AIReadingModel.fromJson(Map<String, dynamic> json) => _$AIReadingModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  DateTime dueDate;
@override final  String content;
@override final  String length;
// New field
@override final  String complexity;
// New field
@override final  String style;
// New field
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AIReadingModelCopyWith<AIReadingModel> get copyWith => _$AIReadingModelCopyWithImpl<AIReadingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AIReadingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AIReadingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.content, content) || other.content == content)&&(identical(other.length, length) || other.length == length)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,content,length,complexity,style,createdAt,updatedAt);

@override
String toString() {
  return 'ActivityModel.aIReading(id: $id, title: $title, description: $description, dueDate: $dueDate, content: $content, length: $length, complexity: $complexity, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AIReadingModelCopyWith<$Res> implements $ActivityModelCopyWith<$Res> {
  factory $AIReadingModelCopyWith(AIReadingModel value, $Res Function(AIReadingModel) _then) = _$AIReadingModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, DateTime dueDate, String content, String length, String complexity, String style, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$AIReadingModelCopyWithImpl<$Res>
    implements $AIReadingModelCopyWith<$Res> {
  _$AIReadingModelCopyWithImpl(this._self, this._then);

  final AIReadingModel _self;
  final $Res Function(AIReadingModel) _then;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? content = null,Object? length = null,Object? complexity = null,Object? style = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(AIReadingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,complexity: null == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
