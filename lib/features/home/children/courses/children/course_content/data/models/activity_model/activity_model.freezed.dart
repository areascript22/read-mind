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
        switch (json['type']) {
                  case 'aIReading':
          return AIReadingModel.fromJson(
            json
          );
                case 'flashCard':
          return FlashCardModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ActivityModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ActivityModel {

 int get id; String get title; String get description; DateTime get dueDate;// New field
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,createdAt,updatedAt);

@override
String toString() {
  return 'ActivityModel(id: $id, title: $title, description: $description, dueDate: $dueDate, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ActivityModelCopyWith<$Res>  {
  factory $ActivityModelCopyWith(ActivityModel value, $Res Function(ActivityModel) _then) = _$ActivityModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, DateTime dueDate, DateTime createdAt, DateTime updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AIReadingModel value)?  aIReading,TResult Function( FlashCardModel value)?  flashCard,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that);case FlashCardModel() when flashCard != null:
return flashCard(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AIReadingModel value)  aIReading,required TResult Function( FlashCardModel value)  flashCard,}){
final _that = this;
switch (_that) {
case AIReadingModel():
return aIReading(_that);case FlashCardModel():
return flashCard(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AIReadingModel value)?  aIReading,TResult? Function( FlashCardModel value)?  flashCard,}){
final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that);case FlashCardModel() when flashCard != null:
return flashCard(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String title,  String description,  DateTime dueDate,  int aiReadingId,  String content,  String length,  String complexity,  String style,  DateTime createdAt,  DateTime updatedAt)?  aIReading,TResult Function( int id,  String title,  String description,  DateTime dueDate,  bool hasScoring,  int? maxScore,  DateTime createdAt,  DateTime updatedAt,  int flashCardActivityId,  int maxCards,  String cardOrder)?  flashCard,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that.id,_that.title,_that.description,_that.dueDate,_that.aiReadingId,_that.content,_that.length,_that.complexity,_that.style,_that.createdAt,_that.updatedAt);case FlashCardModel() when flashCard != null:
return flashCard(_that.id,_that.title,_that.description,_that.dueDate,_that.hasScoring,_that.maxScore,_that.createdAt,_that.updatedAt,_that.flashCardActivityId,_that.maxCards,_that.cardOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String title,  String description,  DateTime dueDate,  int aiReadingId,  String content,  String length,  String complexity,  String style,  DateTime createdAt,  DateTime updatedAt)  aIReading,required TResult Function( int id,  String title,  String description,  DateTime dueDate,  bool hasScoring,  int? maxScore,  DateTime createdAt,  DateTime updatedAt,  int flashCardActivityId,  int maxCards,  String cardOrder)  flashCard,}) {final _that = this;
switch (_that) {
case AIReadingModel():
return aIReading(_that.id,_that.title,_that.description,_that.dueDate,_that.aiReadingId,_that.content,_that.length,_that.complexity,_that.style,_that.createdAt,_that.updatedAt);case FlashCardModel():
return flashCard(_that.id,_that.title,_that.description,_that.dueDate,_that.hasScoring,_that.maxScore,_that.createdAt,_that.updatedAt,_that.flashCardActivityId,_that.maxCards,_that.cardOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String title,  String description,  DateTime dueDate,  int aiReadingId,  String content,  String length,  String complexity,  String style,  DateTime createdAt,  DateTime updatedAt)?  aIReading,TResult? Function( int id,  String title,  String description,  DateTime dueDate,  bool hasScoring,  int? maxScore,  DateTime createdAt,  DateTime updatedAt,  int flashCardActivityId,  int maxCards,  String cardOrder)?  flashCard,}) {final _that = this;
switch (_that) {
case AIReadingModel() when aIReading != null:
return aIReading(_that.id,_that.title,_that.description,_that.dueDate,_that.aiReadingId,_that.content,_that.length,_that.complexity,_that.style,_that.createdAt,_that.updatedAt);case FlashCardModel() when flashCard != null:
return flashCard(_that.id,_that.title,_that.description,_that.dueDate,_that.hasScoring,_that.maxScore,_that.createdAt,_that.updatedAt,_that.flashCardActivityId,_that.maxCards,_that.cardOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AIReadingModel implements ActivityModel {
  const AIReadingModel({required this.id, required this.title, required this.description, required this.dueDate, required this.aiReadingId, required this.content, required this.length, required this.complexity, required this.style, required this.createdAt, required this.updatedAt, final  String? $type}): $type = $type ?? 'aIReading';
  factory AIReadingModel.fromJson(Map<String, dynamic> json) => _$AIReadingModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  DateTime dueDate;
 final  int aiReadingId;
 final  String content;
 final  String length;
// New field
 final  String complexity;
// New field
 final  String style;
// New field
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

@JsonKey(name: 'type')
final String $type;


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AIReadingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.aiReadingId, aiReadingId) || other.aiReadingId == aiReadingId)&&(identical(other.content, content) || other.content == content)&&(identical(other.length, length) || other.length == length)&&(identical(other.complexity, complexity) || other.complexity == complexity)&&(identical(other.style, style) || other.style == style)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,aiReadingId,content,length,complexity,style,createdAt,updatedAt);

@override
String toString() {
  return 'ActivityModel.aIReading(id: $id, title: $title, description: $description, dueDate: $dueDate, aiReadingId: $aiReadingId, content: $content, length: $length, complexity: $complexity, style: $style, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $AIReadingModelCopyWith<$Res> implements $ActivityModelCopyWith<$Res> {
  factory $AIReadingModelCopyWith(AIReadingModel value, $Res Function(AIReadingModel) _then) = _$AIReadingModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, DateTime dueDate, int aiReadingId, String content, String length, String complexity, String style, DateTime createdAt, DateTime updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? aiReadingId = null,Object? content = null,Object? length = null,Object? complexity = null,Object? style = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(AIReadingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,aiReadingId: null == aiReadingId ? _self.aiReadingId : aiReadingId // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,complexity: null == complexity ? _self.complexity : complexity // ignore: cast_nullable_to_non_nullable
as String,style: null == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
@JsonSerializable()

class FlashCardModel implements ActivityModel {
  const FlashCardModel({required this.id, required this.title, required this.description, required this.dueDate, required this.hasScoring, this.maxScore, required this.createdAt, required this.updatedAt, required this.flashCardActivityId, required this.maxCards, required this.cardOrder, final  String? $type}): $type = $type ?? 'flashCard';
  factory FlashCardModel.fromJson(Map<String, dynamic> json) => _$FlashCardModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  DateTime dueDate;
 final  bool hasScoring;
 final  int? maxScore;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
// FLASHCARD SPECIFIC
 final  int flashCardActivityId;
 final  int maxCards;
 final  String cardOrder;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlashCardModelCopyWith<FlashCardModel> get copyWith => _$FlashCardModelCopyWithImpl<FlashCardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlashCardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlashCardModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.hasScoring, hasScoring) || other.hasScoring == hasScoring)&&(identical(other.maxScore, maxScore) || other.maxScore == maxScore)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.flashCardActivityId, flashCardActivityId) || other.flashCardActivityId == flashCardActivityId)&&(identical(other.maxCards, maxCards) || other.maxCards == maxCards)&&(identical(other.cardOrder, cardOrder) || other.cardOrder == cardOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,dueDate,hasScoring,maxScore,createdAt,updatedAt,flashCardActivityId,maxCards,cardOrder);

@override
String toString() {
  return 'ActivityModel.flashCard(id: $id, title: $title, description: $description, dueDate: $dueDate, hasScoring: $hasScoring, maxScore: $maxScore, createdAt: $createdAt, updatedAt: $updatedAt, flashCardActivityId: $flashCardActivityId, maxCards: $maxCards, cardOrder: $cardOrder)';
}


}

/// @nodoc
abstract mixin class $FlashCardModelCopyWith<$Res> implements $ActivityModelCopyWith<$Res> {
  factory $FlashCardModelCopyWith(FlashCardModel value, $Res Function(FlashCardModel) _then) = _$FlashCardModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, DateTime dueDate, bool hasScoring, int? maxScore, DateTime createdAt, DateTime updatedAt, int flashCardActivityId, int maxCards, String cardOrder
});




}
/// @nodoc
class _$FlashCardModelCopyWithImpl<$Res>
    implements $FlashCardModelCopyWith<$Res> {
  _$FlashCardModelCopyWithImpl(this._self, this._then);

  final FlashCardModel _self;
  final $Res Function(FlashCardModel) _then;

/// Create a copy of ActivityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? dueDate = null,Object? hasScoring = null,Object? maxScore = freezed,Object? createdAt = null,Object? updatedAt = null,Object? flashCardActivityId = null,Object? maxCards = null,Object? cardOrder = null,}) {
  return _then(FlashCardModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime,hasScoring: null == hasScoring ? _self.hasScoring : hasScoring // ignore: cast_nullable_to_non_nullable
as bool,maxScore: freezed == maxScore ? _self.maxScore : maxScore // ignore: cast_nullable_to_non_nullable
as int?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,flashCardActivityId: null == flashCardActivityId ? _self.flashCardActivityId : flashCardActivityId // ignore: cast_nullable_to_non_nullable
as int,maxCards: null == maxCards ? _self.maxCards : maxCards // ignore: cast_nullable_to_non_nullable
as int,cardOrder: null == cardOrder ? _self.cardOrder : cardOrder // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
