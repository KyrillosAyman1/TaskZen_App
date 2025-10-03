import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/user_model.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeMode themeMode = ThemeMode.light;

  ThemeCubit() : super(ThemeInitial()) {
    // read saved preference from Hive (synchronous because box already opened in main)
    try {
      final box = Hive.box<UserModel>(kUserBox);
      if (box.isNotEmpty) {
        final user = box.values.first;
        // اذا المستخدم محفوظ بيحتوي isDarkMode
        themeMode = user.isDarkMode ? ThemeMode.dark : ThemeMode.light;
      } else {
        themeMode = ThemeMode.system;
      }
    } catch (e) {
      // لو حصل أي خطأ نخلي الوضع system كـ fallback
      themeMode = ThemeMode.system;
    }
    emit(ThemeChanged());
  }

 void changeTheme(bool isDark) {
  themeMode = isDark ? ThemeMode.dark : ThemeMode.light;

  final box = Hive.box<UserModel>(kUserBox);
  if (box.isNotEmpty) {
    final key = box.keys.first;
    box.put(key, UserModel(
      name: box.values.first.name,
      imageUrl: box.values.first.imageUrl,
      isDarkMode: isDark,
      soundOn: box.values.first.soundOn,
    ));
  }
  emit(ThemeChanged());
}

}






