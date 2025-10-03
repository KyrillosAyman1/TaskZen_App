import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';

import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/user_model.dart';
import 'package:taskzen_app/views/profile/profile_view.dart';
import 'package:taskzen_app/views/home/task_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  Future<void> checkUser() async {
    // افتح الـ Box لو مش مفتوح
    var userBox = Hive.box<UserModel>(kUserBox);
    await Future.delayed(const Duration(seconds: 3)); // سبلاش 3 ثانية

    if (userBox.isNotEmpty) {
      // فيه بيانات → روح للتاسك فيو
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const TaskView()),
        (route) => false,
      );
    } else {
      // مفيش بيانات → روح للبروفايل فيو
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (_) => const ProfileView(isStart: true,)),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Lottie.asset(
              "assets/images/Appointment booking with smartphone (1).json",
              height: 200,
              width: 200,

              //fit: BoxFit.cover,
              repeat: true,
              alignment: Alignment.centerRight,
            ),
          ),
          const Center(
            child: Text(
              "Taskzen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
