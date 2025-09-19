import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskzen_app/views/add%20task/widgets/task_form.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';


class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({super.key});

  @override
  State<EditTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<EditTaskViewBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeoController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  void initState() {
    dateController.text =
        null ?? DateFormat("dd-MM-yyyy").format(DateTime.now());

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startTimeoController.text = TimeOfDay.now().format(context).toString();
    endTimeController.text = TimeOfDay.now().format(context).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TaskForm(
              titleController: titleController,
              descriptionController: descriptionController,
              dateController: dateController,
              startTimeoController: startTimeoController,
              endTimeController: endTimeController,
            ),
             CustomElevatedButton(
              buttonText: "Update Task",
              onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

