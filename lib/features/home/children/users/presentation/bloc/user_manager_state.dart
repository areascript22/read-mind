part of 'user_manager_bloc.dart';

@immutable
sealed class UserManagerState extends Equatable {}

final class UserManagerInitialState extends UserManagerState {
  @override
  List<Object?> get props => [];
}

final class UserManagerLoadingState extends UserManagerState {
  @override
  List<Object?> get props => [];
}

final class UserManagerLoadedState extends UserManagerState {
  final List<UserEntity> users;

  UserManagerLoadedState(this.users);

  @override
  List<Object?> get props => [users];
}

final class UserManagerErrorState extends UserManagerState {
  final String message;

  UserManagerErrorState(this.message);

  @override
  List<Object?> get props => [message];
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
