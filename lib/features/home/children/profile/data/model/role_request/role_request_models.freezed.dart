// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'role_request_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Status {

 int get id; String get name; String get description;@JsonKey(name: 'createdAt') DateTime get createdAt;@JsonKey(name: 'updatedAt') DateTime get updatedAt;
/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusCopyWith<Status> get copyWith => _$StatusCopyWithImpl<Status>(this as Status, _$identity);

  /// Serializes this Status to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Status&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,createdAt,updatedAt);

@override
String toString() {
  return 'Status(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $StatusCopyWith<$Res>  {
  factory $StatusCopyWith(Status value, $Res Function(Status) _then) = _$StatusCopyWithImpl;
@useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'createdAt') DateTime createdAt,@JsonKey(name: 'updatedAt') DateTime updatedAt
});




}
/// @nodoc
class _$StatusCopyWithImpl<$Res>
    implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._self, this._then);

  final Status _self;
  final $Res Function(Status) _then;

/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Status].
extension StatusPatterns on Status {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Status value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Status() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Status value)  $default,){
final _that = this;
switch (_that) {
case _Status():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Status value)?  $default,){
final _that = this;
switch (_that) {
case _Status() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Status() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String description, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Status():
return $default(_that.id,_that.name,_that.description,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String description, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Status() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Status implements Status {
  const _Status({required this.id, required this.name, required this.description, @JsonKey(name: 'createdAt') required this.createdAt, @JsonKey(name: 'updatedAt') required this.updatedAt});
  factory _Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

@override final  int id;
@override final  String name;
@override final  String description;
@override@JsonKey(name: 'createdAt') final  DateTime createdAt;
@override@JsonKey(name: 'updatedAt') final  DateTime updatedAt;

/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusCopyWith<_Status> get copyWith => __$StatusCopyWithImpl<_Status>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Status&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,createdAt,updatedAt);

@override
String toString() {
  return 'Status(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) _then) = __$StatusCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String description,@JsonKey(name: 'createdAt') DateTime createdAt,@JsonKey(name: 'updatedAt') DateTime updatedAt
});




}
/// @nodoc
class __$StatusCopyWithImpl<$Res>
    implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(this._self, this._then);

  final _Status _self;
  final $Res Function(_Status) _then;

/// Create a copy of Status
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Status(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$RoleRequest {

 int get id;@JsonKey(name: 'userId') int get userId;@JsonKey(name: 'requestedRoleId') int get requestedRoleId;@JsonKey(name: 'statusId') int get statusId;@JsonKey(name: 'createdAt') DateTime get createdAt;@JsonKey(name: 'updatedAt') DateTime get updatedAt; Status get status;
/// Create a copy of RoleRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleRequestCopyWith<RoleRequest> get copyWith => _$RoleRequestCopyWithImpl<RoleRequest>(this as RoleRequest, _$identity);

  /// Serializes this RoleRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.requestedRoleId, requestedRoleId) || other.requestedRoleId == requestedRoleId)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,requestedRoleId,statusId,createdAt,updatedAt,status);

@override
String toString() {
  return 'RoleRequest(id: $id, userId: $userId, requestedRoleId: $requestedRoleId, statusId: $statusId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $RoleRequestCopyWith<$Res>  {
  factory $RoleRequestCopyWith(RoleRequest value, $Res Function(RoleRequest) _then) = _$RoleRequestCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'userId') int userId,@JsonKey(name: 'requestedRoleId') int requestedRoleId,@JsonKey(name: 'statusId') int statusId,@JsonKey(name: 'createdAt') DateTime createdAt,@JsonKey(name: 'updatedAt') DateTime updatedAt, Status status
});


$StatusCopyWith<$Res> get status;

}
/// @nodoc
class _$RoleRequestCopyWithImpl<$Res>
    implements $RoleRequestCopyWith<$Res> {
  _$RoleRequestCopyWithImpl(this._self, this._then);

  final RoleRequest _self;
  final $Res Function(RoleRequest) _then;

/// Create a copy of RoleRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? requestedRoleId = null,Object? statusId = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,requestedRoleId: null == requestedRoleId ? _self.requestedRoleId : requestedRoleId // ignore: cast_nullable_to_non_nullable
as int,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,
  ));
}
/// Create a copy of RoleRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCopyWith<$Res> get status {
  
  return $StatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoleRequest].
extension RoleRequestPatterns on RoleRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleRequest value)  $default,){
final _that = this;
switch (_that) {
case _RoleRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RoleRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'userId')  int userId, @JsonKey(name: 'requestedRoleId')  int requestedRoleId, @JsonKey(name: 'statusId')  int statusId, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt,  Status status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleRequest() when $default != null:
return $default(_that.id,_that.userId,_that.requestedRoleId,_that.statusId,_that.createdAt,_that.updatedAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'userId')  int userId, @JsonKey(name: 'requestedRoleId')  int requestedRoleId, @JsonKey(name: 'statusId')  int statusId, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt,  Status status)  $default,) {final _that = this;
switch (_that) {
case _RoleRequest():
return $default(_that.id,_that.userId,_that.requestedRoleId,_that.statusId,_that.createdAt,_that.updatedAt,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'userId')  int userId, @JsonKey(name: 'requestedRoleId')  int requestedRoleId, @JsonKey(name: 'statusId')  int statusId, @JsonKey(name: 'createdAt')  DateTime createdAt, @JsonKey(name: 'updatedAt')  DateTime updatedAt,  Status status)?  $default,) {final _that = this;
switch (_that) {
case _RoleRequest() when $default != null:
return $default(_that.id,_that.userId,_that.requestedRoleId,_that.statusId,_that.createdAt,_that.updatedAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleRequest implements RoleRequest {
  const _RoleRequest({required this.id, @JsonKey(name: 'userId') required this.userId, @JsonKey(name: 'requestedRoleId') required this.requestedRoleId, @JsonKey(name: 'statusId') required this.statusId, @JsonKey(name: 'createdAt') required this.createdAt, @JsonKey(name: 'updatedAt') required this.updatedAt, required this.status});
  factory _RoleRequest.fromJson(Map<String, dynamic> json) => _$RoleRequestFromJson(json);

@override final  int id;
@override@JsonKey(name: 'userId') final  int userId;
@override@JsonKey(name: 'requestedRoleId') final  int requestedRoleId;
@override@JsonKey(name: 'statusId') final  int statusId;
@override@JsonKey(name: 'createdAt') final  DateTime createdAt;
@override@JsonKey(name: 'updatedAt') final  DateTime updatedAt;
@override final  Status status;

/// Create a copy of RoleRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleRequestCopyWith<_RoleRequest> get copyWith => __$RoleRequestCopyWithImpl<_RoleRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.requestedRoleId, requestedRoleId) || other.requestedRoleId == requestedRoleId)&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,requestedRoleId,statusId,createdAt,updatedAt,status);

@override
String toString() {
  return 'RoleRequest(id: $id, userId: $userId, requestedRoleId: $requestedRoleId, statusId: $statusId, createdAt: $createdAt, updatedAt: $updatedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$RoleRequestCopyWith<$Res> implements $RoleRequestCopyWith<$Res> {
  factory _$RoleRequestCopyWith(_RoleRequest value, $Res Function(_RoleRequest) _then) = __$RoleRequestCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'userId') int userId,@JsonKey(name: 'requestedRoleId') int requestedRoleId,@JsonKey(name: 'statusId') int statusId,@JsonKey(name: 'createdAt') DateTime createdAt,@JsonKey(name: 'updatedAt') DateTime updatedAt, Status status
});


@override $StatusCopyWith<$Res> get status;

}
/// @nodoc
class __$RoleRequestCopyWithImpl<$Res>
    implements _$RoleRequestCopyWith<$Res> {
  __$RoleRequestCopyWithImpl(this._self, this._then);

  final _RoleRequest _self;
  final $Res Function(_RoleRequest) _then;

/// Create a copy of RoleRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? requestedRoleId = null,Object? statusId = null,Object? createdAt = null,Object? updatedAt = null,Object? status = null,}) {
  return _then(_RoleRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,requestedRoleId: null == requestedRoleId ? _self.requestedRoleId : requestedRoleId // ignore: cast_nullable_to_non_nullable
as int,statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as Status,
  ));
}

/// Create a copy of RoleRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StatusCopyWith<$Res> get status {
  
  return $StatusCopyWith<$Res>(_self.status, (value) {
    return _then(_self.copyWith(status: value));
  });
}
}


/// @nodoc
mixin _$RoleRequestResponse {

 RoleRequest get roleRequest;
/// Create a copy of RoleRequestResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleRequestResponseCopyWith<RoleRequestResponse> get copyWith => _$RoleRequestResponseCopyWithImpl<RoleRequestResponse>(this as RoleRequestResponse, _$identity);

  /// Serializes this RoleRequestResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleRequestResponse&&(identical(other.roleRequest, roleRequest) || other.roleRequest == roleRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleRequest);

@override
String toString() {
  return 'RoleRequestResponse(roleRequest: $roleRequest)';
}


}

/// @nodoc
abstract mixin class $RoleRequestResponseCopyWith<$Res>  {
  factory $RoleRequestResponseCopyWith(RoleRequestResponse value, $Res Function(RoleRequestResponse) _then) = _$RoleRequestResponseCopyWithImpl;
@useResult
$Res call({
 RoleRequest roleRequest
});


$RoleRequestCopyWith<$Res> get roleRequest;

}
/// @nodoc
class _$RoleRequestResponseCopyWithImpl<$Res>
    implements $RoleRequestResponseCopyWith<$Res> {
  _$RoleRequestResponseCopyWithImpl(this._self, this._then);

  final RoleRequestResponse _self;
  final $Res Function(RoleRequestResponse) _then;

/// Create a copy of RoleRequestResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roleRequest = null,}) {
  return _then(_self.copyWith(
roleRequest: null == roleRequest ? _self.roleRequest : roleRequest // ignore: cast_nullable_to_non_nullable
as RoleRequest,
  ));
}
/// Create a copy of RoleRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleRequestCopyWith<$Res> get roleRequest {
  
  return $RoleRequestCopyWith<$Res>(_self.roleRequest, (value) {
    return _then(_self.copyWith(roleRequest: value));
  });
}
}


/// Adds pattern-matching-related methods to [RoleRequestResponse].
extension RoleRequestResponsePatterns on RoleRequestResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleRequestResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleRequestResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleRequestResponse value)  $default,){
final _that = this;
switch (_that) {
case _RoleRequestResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleRequestResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RoleRequestResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RoleRequest roleRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleRequestResponse() when $default != null:
return $default(_that.roleRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RoleRequest roleRequest)  $default,) {final _that = this;
switch (_that) {
case _RoleRequestResponse():
return $default(_that.roleRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RoleRequest roleRequest)?  $default,) {final _that = this;
switch (_that) {
case _RoleRequestResponse() when $default != null:
return $default(_that.roleRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleRequestResponse implements RoleRequestResponse {
  const _RoleRequestResponse({required this.roleRequest});
  factory _RoleRequestResponse.fromJson(Map<String, dynamic> json) => _$RoleRequestResponseFromJson(json);

@override final  RoleRequest roleRequest;

/// Create a copy of RoleRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleRequestResponseCopyWith<_RoleRequestResponse> get copyWith => __$RoleRequestResponseCopyWithImpl<_RoleRequestResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleRequestResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleRequestResponse&&(identical(other.roleRequest, roleRequest) || other.roleRequest == roleRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roleRequest);

@override
String toString() {
  return 'RoleRequestResponse(roleRequest: $roleRequest)';
}


}

/// @nodoc
abstract mixin class _$RoleRequestResponseCopyWith<$Res> implements $RoleRequestResponseCopyWith<$Res> {
  factory _$RoleRequestResponseCopyWith(_RoleRequestResponse value, $Res Function(_RoleRequestResponse) _then) = __$RoleRequestResponseCopyWithImpl;
@override @useResult
$Res call({
 RoleRequest roleRequest
});


@override $RoleRequestCopyWith<$Res> get roleRequest;

}
/// @nodoc
class __$RoleRequestResponseCopyWithImpl<$Res>
    implements _$RoleRequestResponseCopyWith<$Res> {
  __$RoleRequestResponseCopyWithImpl(this._self, this._then);

  final _RoleRequestResponse _self;
  final $Res Function(_RoleRequestResponse) _then;

/// Create a copy of RoleRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roleRequest = null,}) {
  return _then(_RoleRequestResponse(
roleRequest: null == roleRequest ? _self.roleRequest : roleRequest // ignore: cast_nullable_to_non_nullable
as RoleRequest,
  ));
}

/// Create a copy of RoleRequestResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RoleRequestCopyWith<$Res> get roleRequest {
  
  return $RoleRequestCopyWith<$Res>(_self.roleRequest, (value) {
    return _then(_self.copyWith(roleRequest: value));
  });
}
}

// dart format on
