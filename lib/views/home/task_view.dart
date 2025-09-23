import 'package:flutter/material.dart';
import 'package:taskzen_app/views/home/widgets/task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
      child: const Scaffold(body: TaskViewBody()));
  }
}
