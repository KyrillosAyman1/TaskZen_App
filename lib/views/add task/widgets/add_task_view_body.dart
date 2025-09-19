import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskzen_app/views/add%20task/widgets/color_field.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/date_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/time_field.dart';

class AddTaskViewBody extends StatefulWidget {
  const AddTaskViewBody({super.key});

  @override
  State<AddTaskViewBody> createState() => _AddTaskViewBodyState();
}

class _AddTaskViewBodyState extends State<AddTaskViewBody> {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            CustomTextField(
              controller: titleController,
              hint: "Enter task title",
            ),

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
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
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

            ColorField(),

            SizedBox(height: 70),

            CustomElevatedButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
