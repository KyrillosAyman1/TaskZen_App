import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:taskzen_app/cubit/add_task_cubit/add_task_cubit.dart';
import 'package:taskzen_app/views/add%20task/widgets/task_form.dart';


class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          if (state is AddTaskSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task Added Successfully')));
          } else if (state is AddTaskFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddTaskLoading ? true : false,
            child: SingleChildScrollView(child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TaskForm(),
            )),
          );
        },
      ),
    );
  }
}
