import 'package:flutter/material.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/views/add%20task/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new,color: kPrimaryColor,)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Add Task',style: TextStyle(color: kPrimaryColor),),
      ),
      body: const AddTaskViewBody(),
    );
  }
}
