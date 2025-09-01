import 'package:bloc/bloc.dart';
import 'package:client_app/core/common/entities/user_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_user_state.dart';

class AppUserCubit extends Cubit<AppUserState> {
  AppUserCubit() : super(AppUserInitial());

  void updateUser(UserEntity userEntity){
    emit(AppUserLoggedIn(userEntity));
  }

  void updateUserFailure(String message){
    emit(AppUserFailure(message));
  }
}
