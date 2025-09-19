
import 'package:flutter/material.dart';
import 'package:taskzen_app/views/add%20task/widgets/color_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/date_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/time_field.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.dateController,
    required this.startTimeoController,
    required this.endTimeController,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController dateController;
  final TextEditingController startTimeoController;
  final TextEditingController endTimeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Title",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        CustomTextField(controller: titleController, hint: "Enter task title"),

        Text(
          "Description",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        CustomTextField(
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  TimeField(timeController: startTimeoController),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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

        ColorField(),

        SizedBox(height: 70),
      ],
    );
  }
}
