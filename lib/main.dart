import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:taskzen_app/cubit/user_cubit/user_cubit.dart';

import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/models/user_model.dart';
import 'package:taskzen_app/simple_bloc_observer.dart';
import 'package:taskzen_app/views/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم مع async

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter()); // الأول تسجّل
  Hive.registerAdapter(UserModelAdapter()); // الأول تسجّل

  // await Hive.deleteBoxFromDisk(kTaskBox);
  await Hive.openBox<TaskModel>(kTaskBox); // بعدين تفتح الـ Box
  await Hive.openBox<UserModel>(kUserBox);
//var userBox = await Hive.openBox<UserModel>(kUserBox);

//   // مسح البيانات
//   await userBox.clear();
     // بعدين تفتح الـ Box

  Bloc.observer = SimpleBlocObserver();
  runApp(const TaskzenApp());
}

class TaskzenApp extends StatelessWidget {
  const TaskzenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskCubit()),
        BlocProvider(create: (context) => UserCubit()),
        BlocProvider(create: (context) => ThemeCubit()),

      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: BlocProvider.of<ThemeCubit>(context).themeMode,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
              fontFamily: 'Poppins',
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.lightBlue,
                brightness: Brightness.dark,
              ),
              fontFamily: 'Poppins',
            ),
               
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
