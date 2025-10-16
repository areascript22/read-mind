part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent extends Equatable {}

final class ProfileRequestRoleEvent extends ProfileEvent {
  final int requestedRole;

  ProfileRequestRoleEvent(this.requestedRole);
  @override
  List<Object?> get props => [requestedRole];
}
