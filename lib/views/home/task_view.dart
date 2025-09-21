import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/views/home/widgets/task_view_body.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(),
      child: const Scaffold(body: TaskViewBody()),
    );
  }
}
