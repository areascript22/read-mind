import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/features/auth/domain/usecases/current_user.dart';
import 'package:client_app/features/auth/domain/usecases/user_sign_in.dart';
import 'package:client_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignIn userSignIn;
  final UserSignUp userSignUp;
  final CurrentUser currentUser;
  final AppUserCubit appUserCubit;

  AuthBloc(
    this.userSignIn,
    this.userSignUp,
    this.currentUser,
    this.appUserCubit,
  ) : super(AuthInitialState()) {
    on<AuthEvent>((event, emit) => emit(AuthLoadingState()));
    on<AuthSignInEvent>(_onAuthSignIn);
    on<AuthIsUserLoggedIn>(_onAuthUserIsLoggedIn);
  }

  void _onAuthSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    final response = await userSignIn(
      UserSignInParams(email: event.email, password: event.password),
    );
    response.fold(
      (l) => emit(AuthFailureState(l.message)),
      (r) => emit(AuthSuccessState()),
    );
  }

  void _onAuthUserIsLoggedIn(
    AuthIsUserLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final response = await currentUser(Noparams());
    response.fold(
      (l) => _emitAuthFailure(emit,l.message),
      (r) => _emitAuthSuccess(emit, r),
    );
  }

  void _emitAuthFailure(Emitter<AuthState> emit, String message){
    appUserCubit.updateUserFailure(message);
    emit(AuthFailureState(message));
  }

  void _emitAuthSuccess(Emitter<AuthState> emit, UserEntity userEntity) {
    appUserCubit.updateUser(userEntity);
    emit(AuthSuccessState());
  }
}
