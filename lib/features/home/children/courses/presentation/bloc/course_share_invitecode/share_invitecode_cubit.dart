import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/children/courses/presentation/services/share_service.dart';
import 'package:flutter/material.dart';

part 'share_invitecode_state.dart';

class ShareInvitecodeCubit extends Cubit<ShareInvitecodeState> {
  final ShareService shareService;

  ShareInvitecodeCubit(this.shareService) : super(ShareInvitecodeInitial());

  void shareInviteCode(String inviteCode) async {
    emit(ShareInvitecodeLoading());
    final response = await shareService.shareText(inviteCode);
    response.fold(
      (l) => emit(ShareInvitecodefailure(l.message)),
      (r) => emit(ShareInvitecodeSuccess(r)),
    );
  }
}
