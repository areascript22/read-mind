part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileRequestRoleLoading extends ProfileState {}

final class ProfileRequestRoleSuccess extends ProfileState {
  final RoleRequestEntity roleRequest;

  ProfileRequestRoleSuccess(this.roleRequest);
}

final class ProfileRequestRoleError extends ProfileState {
  final String message;

  ProfileRequestRoleError(this.message);
}
