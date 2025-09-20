import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskzen_app/views/add%20task/widgets/task_form.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';


class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
 


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: TaskForm(),
      ),
    );
  }
}

