part of 'user_manager_bloc.dart';

@immutable
sealed class UserManagerEvent extends Equatable {
  const UserManagerEvent();
}

class GetAllUsersEvent extends UserManagerEvent {
  final int page;
  final int limit;
  final String role;

  const GetAllUsersEvent(this.page, this.limit, this.role);

  @override
  List<Object?> get props => [page, limit, role];
}

class SearchUsersEvent extends UserManagerEvent {
  final String query;
  final String? role;

  const SearchUsersEvent({required this.query, this.role});

  @override
  List<Object?> get props => [query, role];
}

class UpdateUserRoleEvent extends UserManagerEvent {
  final String targetUserId;
  final String newRole;

  const UpdateUserRoleEvent({
    required this.targetUserId,
    required this.newRole,
  });

  @override
  List<Object?> get props => [targetUserId, newRole];
}

class GetAllRoleRequestsEvent extends UserManagerEvent {
  @override
  List<Object?> get props => [];
}
