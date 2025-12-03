part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;

  AuthSignInEvent({required this.email, required this.password});
}

final class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String lastName;

  AuthSignUpEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
  });
}

final class AuthIsUserLoggedIn extends AuthEvent {}

final class AuthUserForgotPassword extends AuthEvent {
  final String email;

  AuthUserForgotPassword({required this.email});
}

final class AuthResendVerificationLink extends AuthEvent {
  final String email;

  AuthResendVerificationLink({required this.email});
}
