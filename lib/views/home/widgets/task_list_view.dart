import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/home/widgets/task_card.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TaskCubit>(context).tasks!;
        return Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            padding: EdgeInsets.only(top: 8),
            itemBuilder: (context, index) {
              return const TaskCard();
            },
          ),
        );
      },
    );
  }
}
