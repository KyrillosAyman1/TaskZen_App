import 'package:flutter/material.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/edit%20task/widget/task_edit_form.dart';



class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key,required this.taskModel});
  final TaskModel   taskModel;
  @override
  State<EditTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<EditTaskViewBody> {



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TaskEditForm( taskModel: widget.taskModel,)
          ],
        ),
      ),
    );
  }
}

