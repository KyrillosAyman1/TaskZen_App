import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskzen_app/cubit/task_cubit/task_cubit.dart';
import 'package:taskzen_app/helper/custom_show_snak_bar.dart';
import 'package:taskzen_app/models/task_model.dart';
import 'package:taskzen_app/views/add%20task/widgets/color_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/date_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/time_field.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';

class TaskEditForm extends StatefulWidget {
  const TaskEditForm({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<TaskEditForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskEditForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  // ignore: deprecated_member_use
  int selectedColor = Colors.lightBlue.value;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    startTimeController.dispose();
    endTimeController.dispose();
    colorController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    dateController.text = widget.taskModel.date!;
    colorController.text = widget.taskModel.color!.toString();
    titleController.text = widget.taskModel.title!;
    descriptionController.text = widget.taskModel.description!;
    startTimeController.text = widget.taskModel.startTime!;
    endTimeController.text = widget.taskModel.endTime!;
    colorController.text = "Click to select color";
    selectedColor = widget.taskModel.color!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Title",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          CustomTextField(
            onChanged: (value) {
              titleController.text = value;
            },
            controller: titleController,
            hint: "Enter task title",
          ),

          Text(
            "Description",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          CustomTextField(
            onChanged: (value) {
              descriptionController.text = value;
            },
            controller: descriptionController,
            hint: "Enter task description",
            maxLines: 5,
          ),

          Text(
            "Date",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          DateField(dateController: dateController),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Start Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    TimeField(timeController: startTimeController),
                  ],
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "End Time",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TimeField(timeController: endTimeController),
                  ],
                ),
              ),
            ],
          ),

          Text(
            "Color",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),

          ColorField(
            colorController: colorController,
            selectedColor: selectedColor,
            onColorSelected: (value) =>  setState(() {
              selectedColor = value;
            }),
          ),

          SizedBox(height: 30),
          CustomElevatedButton(
            buttonText: "Update Task",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                widget.taskModel.title = titleController.text;
                widget.taskModel.description = descriptionController.text;
                widget.taskModel.date = dateController.text;
                widget.taskModel.startTime = startTimeController.text;
                widget.taskModel.endTime = endTimeController.text;
                widget.taskModel.color = selectedColor;
                widget.taskModel.isCompleted = false;
                widget.taskModel.save();
                //BlocProvider.of<TaskCubit>(context).fetchAllTasks();
                BlocProvider.of<TaskCubit>(
                  context,
                ).fetchTasks(dateController.text);
                Navigator.pop(context);
                customShowSnackBar(
                  context: context,
                  message: "Task updated successfully",
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
