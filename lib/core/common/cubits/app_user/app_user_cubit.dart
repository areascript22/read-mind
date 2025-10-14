import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:client_app/core/common/enums/user_roles.dart';
import 'package:client_app/shared/datasources/auth_local_datasource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  final AuthLocalDataSource authLocalDataSource;
  AppUserCubit({required this.authLocalDataSource}) : super(AppUserInitial());

  void updateUser(UserEntity userEntity) {
    emit(AppUserLoggedIn(userEntity));
  }

  void updateUserFailure(String message) {
    emit(AppUserFailure(message));
  }

  void logout() async {
    await authLocalDataSource.clearJwt();
    emit(AppUserInitial());
  }

  UserEntity? get user =>
      state is AppUserLoggedIn ? (state as AppUserLoggedIn).userEntity : null;

  bool get isProfessor => user?.role.name == UserRoles.professor.name;
}
