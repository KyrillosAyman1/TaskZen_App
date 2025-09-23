import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';

import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/models/user_model.dart';
import 'package:taskzen_app/simple_bloc_observer.dart';
import 'package:taskzen_app/views/home/task_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // مهم مع async

  await Hive.initFlutter();

  Hive.registerAdapter(TaskModelAdapter()); // الأول تسجّل
  Hive.registerAdapter(UserModelAdapter()); // الأول تسجّل
  
  // await Hive.deleteBoxFromDisk(kTaskBox);
  await Hive.openBox<TaskModel>(kTaskBox); // بعدين تفتح الـ Box
  await Hive.openBox<UserModel>(kUserBox); // بعدين تفتح الـ Box

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
        BlocProvider(
      create: (context) => TaskCubit(), )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
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
      
        home: const TaskView(),
      ),
    );
  }
}
