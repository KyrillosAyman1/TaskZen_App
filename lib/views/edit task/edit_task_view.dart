import 'package:flutter/material.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/edit%20task/widget/edit_task_view_body.dart';

class EditTaskView extends StatelessWidget {
  const EditTaskView({super.key, required this.taskModel});
   final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new,color: kPrimaryColor,)),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Edit Task',style: TextStyle(color: kPrimaryColor),),
        ),
        body:  EditTaskViewBody(taskModel: taskModel,)
      ),
    );
  }
}
