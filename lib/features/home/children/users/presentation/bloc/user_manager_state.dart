part of 'user_manager_bloc.dart';

enum UserManagerAction { roleRequests, getAllUsers, searchUser }

@immutable
sealed class UserManagerState extends Equatable {}

final class UserManagerInitialState extends UserManagerState {
  @override
  List<Object?> get props => [];
}

final class UserManagerLoadingState extends UserManagerState {
  final UserManagerAction action;

  UserManagerLoadingState(this.action);

  @override
  List<Object?> get props => [action];
}

final class UserManagerLoadedState extends UserManagerState {
  final List<UserEntity> users;

  UserManagerLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

final class UserManagerErrorState extends UserManagerState {
  final String message;
  final UserManagerAction action;

  UserManagerErrorState(this.message, this.action);

  @override
  List<Object?> get props => [message, action];
}

final class UserRoleUpdatingState extends UserManagerState {
  @override
  List<Object?> get props => [];
}

final class UserRoleUpdatedState extends UserManagerState {
  final UserEntity updatedUser;

  UserRoleUpdatedState(this.updatedUser);

  @override
  List<Object?> get props => [updatedUser];
}

final class UserRoleUpdateErrorState extends UserManagerState {
  final String message;

  UserRoleUpdateErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

final class RoleRequestsLoaded extends UserManagerState {
  final List<ComposedRequestEntity> roleRequests;

  RoleRequestsLoaded(this.roleRequests);

  @override
  List<Object?> get props => [roleRequests];
}
