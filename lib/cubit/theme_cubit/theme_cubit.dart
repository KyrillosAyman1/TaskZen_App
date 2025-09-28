import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/user_model.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeMode themeMode = ThemeMode.system;

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

    // نحفظ القيمة في نفس الـ Hive box الخاص بالمستخدم
    try {
      final box = Hive.box<UserModel>(kUserBox);
      if (box.isNotEmpty) {
        final existing = box.values.first;
        final updatedUser = UserModel(
          isDarkMode: isDark,
          soundOn: existing.soundOn,
          name: existing.name,
          imageUrl: existing.imageUrl,
        );
        // نستخدم نفس الـ key لأول عنصر
        final key = box.keys.first;
        box.put(key, updatedUser);
      } else {
        // لو مفيش user واحد سابق نضيف واحد جديد بقيم افتراضية للـ other fields
        final newUser = UserModel(
          isDarkMode: isDark,
          soundOn: false,
          name: '',
          imageUrl: '',
        );
        box.add(newUser);
      }
    } catch (e) {
      // تقدر تسجل الخطأ هنا لو حابب، لكن مش لازم
    }

    emit(ThemeChanged());
  }
}






