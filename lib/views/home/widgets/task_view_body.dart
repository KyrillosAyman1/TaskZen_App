
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/views/home/widgets/custom_app_bar.dart';
import 'package:taskzen_app/views/home/widgets/custom_date_picker.dart';
import 'package:taskzen_app/views/home/widgets/task_list_view.dart';
import 'package:taskzen_app/views/home/widgets/today_data.dart';

class TaskViewBody extends StatefulWidget {
  const TaskViewBody({super.key});

  @override
  State<TaskViewBody> createState() => _TaskViewBodyState();
}

class _TaskViewBodyState extends State<TaskViewBody> {
  @override
  void initState() {
    BlocProvider.of<TaskCubit>(context).fetchAllTasks();
  
  


    

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        CustomAppBar(),
        TodayData(),
        CustomDatePicker(),
        TaskListView()
      ],
    );
  }
}


