
import 'package:flutter/material.dart';
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


