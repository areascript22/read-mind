part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final UserEntity userEntity;
  AuthSuccessState(this.userEntity);
}

final class AuthFailureState extends AuthState {
  final String message;
  AuthFailureState(this.message);
}

final class AuthResetPasswordLinkSent extends AuthState {
  final String message;

  AuthResetPasswordLinkSent({required this.message});
}
