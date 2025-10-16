import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:client_app/features/home/children/profile/domain/entity/role_request_entity.dart';
import 'package:client_app/features/home/children/profile/domain/repository/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository}) : super(ProfileInitial()) {
    on<ProfileRequestRoleEvent>(_onProfileRequestRole);
  }

  Future<void> _onProfileRequestRole(
    ProfileRequestRoleEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileRequestRoleLoading());

    final result = await profileRepository.requestRole(
      requestedRole: event.requestedRole,
    );

    result.fold(
      (failure) => emit(ProfileRequestRoleError(failure.message)),
      (roleRequest) => emit(ProfileRequestRoleSuccess(roleRequest)),
    );
  }
}
