import 'package:flutter/material.dart';
import 'package:taskzen_app/views/task_view.dart';

void main() {
  runApp(const TaskzenApp());
}

class TaskzenApp extends StatelessWidget {
  const TaskzenApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        fontFamily: 'Changa One',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlue,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Changa One',
      ),

      home: const TaskView(),
    );
  }
}
