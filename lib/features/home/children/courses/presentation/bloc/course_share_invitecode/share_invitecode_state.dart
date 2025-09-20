part of 'share_invitecode_cubit.dart';

@immutable
sealed class ShareInvitecodeState {}

final class ShareInvitecodeInitial extends ShareInvitecodeState {}

final class ShareInvitecodeLoading extends ShareInvitecodeState {}

final class ShareInvitecodefailure extends ShareInvitecodeState {
  final String message;
  ShareInvitecodefailure(this.message);
}

final class ShareInvitecodeSuccess extends ShareInvitecodeState {
  final String sharedInviteCode;
  ShareInvitecodeSuccess(this.sharedInviteCode);
}
