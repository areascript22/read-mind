import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/home/children/users/domain/repositories/user_manager_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_manager_event.dart';
part 'user_manager_state.dart';

class UserManagerBloc extends Bloc<UserManagerEvent, UserManagerState> {
  final UserManagerRepository userManagerRepository;

  UserManagerBloc({required this.userManagerRepository})
    : super(UserManagerInitialState()) {
    on<GetAllUsersEvent>(_onGetAllUsers);
    on<SearchUsersEvent>(_onSearchUsers);
    on<UpdateUserRoleEvent>(_onUpdateUserRole);
  }

  void _onGetAllUsers(
    GetAllUsersEvent event,
    Emitter<UserManagerState> emit,
  ) async {
    emit(UserManagerLoadingState());

    final response = await userManagerRepository.getAllUsers(
      page: event.page,
      limit: event.limit,
      role: event.role,
    );

    response.fold(
      (l) => emit(UserManagerErrorState(l.message)),
      (r) => emit(UserManagerLoadedState(r)),
    );
  }

  void _onSearchUsers(
    SearchUsersEvent event,
    Emitter<UserManagerState> emit,
  ) async {
    emit(UserManagerLoadingState());

    final response = await userManagerRepository.searchUsers(
      query: event.query,
      role: event.role,
    );

    response.fold(
      (l) => emit(UserManagerErrorState(l.message)),
      (r) => emit(UserManagerLoadedState(r)),
    );
  }

  void _onUpdateUserRole(
    UpdateUserRoleEvent event,
    Emitter<UserManagerState> emit,
  ) async {
    emit(UserRoleUpdatingState());

    final response = await userManagerRepository.updateUserRole(
      targetUserId: event.targetUserId,
      newRole: event.newRole,
    );

    response.fold(
      (l) => emit(UserRoleUpdateErrorState(l.message)),
      (r) => emit(UserRoleUpdatedState(r)),
    );
  }
}
