// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PreferencesModel {

 int get id; int get userId; bool get seenNotificationDialog; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesModelCopyWith<PreferencesModel> get copyWith => _$PreferencesModelCopyWithImpl<PreferencesModel>(this as PreferencesModel, _$identity);

  /// Serializes this PreferencesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreferencesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.seenNotificationDialog, seenNotificationDialog) || other.seenNotificationDialog == seenNotificationDialog)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,seenNotificationDialog,createdAt,updatedAt);

@override
String toString() {
  return 'PreferencesModel(id: $id, userId: $userId, seenNotificationDialog: $seenNotificationDialog, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $PreferencesModelCopyWith<$Res>  {
  factory $PreferencesModelCopyWith(PreferencesModel value, $Res Function(PreferencesModel) _then) = _$PreferencesModelCopyWithImpl;
@useResult
$Res call({
 int id, int userId, bool seenNotificationDialog, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$PreferencesModelCopyWithImpl<$Res>
    implements $PreferencesModelCopyWith<$Res> {
  _$PreferencesModelCopyWithImpl(this._self, this._then);

  final PreferencesModel _self;
  final $Res Function(PreferencesModel) _then;

/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? seenNotificationDialog = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,seenNotificationDialog: null == seenNotificationDialog ? _self.seenNotificationDialog : seenNotificationDialog // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [PreferencesModel].
extension PreferencesModelPatterns on PreferencesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreferencesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreferencesModel value)  $default,){
final _that = this;
switch (_that) {
case _PreferencesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreferencesModel value)?  $default,){
final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int userId,  bool seenNotificationDialog,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
return $default(_that.id,_that.userId,_that.seenNotificationDialog,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int userId,  bool seenNotificationDialog,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _PreferencesModel():
return $default(_that.id,_that.userId,_that.seenNotificationDialog,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int userId,  bool seenNotificationDialog,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _PreferencesModel() when $default != null:
return $default(_that.id,_that.userId,_that.seenNotificationDialog,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreferencesModel implements PreferencesModel {
  const _PreferencesModel({required this.id, required this.userId, required this.seenNotificationDialog, required this.createdAt, required this.updatedAt});
  factory _PreferencesModel.fromJson(Map<String, dynamic> json) => _$PreferencesModelFromJson(json);

@override final  int id;
@override final  int userId;
@override final  bool seenNotificationDialog;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesModelCopyWith<_PreferencesModel> get copyWith => __$PreferencesModelCopyWithImpl<_PreferencesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreferencesModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreferencesModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.seenNotificationDialog, seenNotificationDialog) || other.seenNotificationDialog == seenNotificationDialog)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,seenNotificationDialog,createdAt,updatedAt);

@override
String toString() {
  return 'PreferencesModel(id: $id, userId: $userId, seenNotificationDialog: $seenNotificationDialog, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$PreferencesModelCopyWith<$Res> implements $PreferencesModelCopyWith<$Res> {
  factory _$PreferencesModelCopyWith(_PreferencesModel value, $Res Function(_PreferencesModel) _then) = __$PreferencesModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int userId, bool seenNotificationDialog, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$PreferencesModelCopyWithImpl<$Res>
    implements _$PreferencesModelCopyWith<$Res> {
  __$PreferencesModelCopyWithImpl(this._self, this._then);

  final _PreferencesModel _self;
  final $Res Function(_PreferencesModel) _then;

/// Create a copy of PreferencesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? seenNotificationDialog = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_PreferencesModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,seenNotificationDialog: null == seenNotificationDialog ? _self.seenNotificationDialog : seenNotificationDialog // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
