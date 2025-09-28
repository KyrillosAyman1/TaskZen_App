import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart' show Hive;
import 'package:meta/meta.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void loadUser() {
    var userBox = Hive.box<UserModel>(kUserBox);
    if (userBox.isNotEmpty) {
      emit(UserSuccess(userBox.values.toList()));
    } else {
      emit(UserEmpty());
    }
  }

  Future<void> addUser(UserModel user) async {
    try {
      var userBox = Hive.box<UserModel>(kUserBox);
      await userBox.clear();
      await userBox.add(user);
      loadUser(); // بعد الإضافة حدث الحالة
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      var userBox = Hive.box<UserModel>(kUserBox);
      await userBox.clear();
      await userBox.add(user);
      loadUser();
      emit(UserSuccess(userBox.values.toList())); // بعد الإضافة حدث الحالة
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
