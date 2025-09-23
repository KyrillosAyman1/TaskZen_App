import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/home/widgets/task_card.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TaskCubit>(context).tasksByDate!;

       
          return tasks.isEmpty? Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Lottie.asset(
                        "assets/images/Appointment booking with smartphone (1).json",
                        height: 200,
                        width: 200,
                        
                        //fit: BoxFit.cover,
                        repeat: true,
                        alignment: Alignment.centerRight,
                      ),
          ): Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: tasks.length,
              padding: EdgeInsets.only(top: 8),
              itemBuilder: (context, index) {
                return TaskCard(taskModel: tasks[index]);
              },
            ),
          );
       
      },
    );
  }
}
