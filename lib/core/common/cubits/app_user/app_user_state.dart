part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState extends Equatable{}

final class AppUserInitial extends AppUserState {
  @override
  List<Object?> get props => [];
}
final class AppUserLoggedIn extends AppUserState {
  final UserEntity userEntity;
  AppUserLoggedIn(this.userEntity);
  @override
  List<Object?> get props => [];
}

