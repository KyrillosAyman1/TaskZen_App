import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskzen_app/views/add%20task/widgets/color_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/date_field.dart';
import 'package:taskzen_app/views/add%20task/widgets/time_field.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({
    super.key,
  });


  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
   final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
    dateController.text =
        null ?? DateFormat("dd-MM-yyyy").format(DateTime.now());
     colorController.text = Colors.lightBlue.value.toInt().toString();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startTimeController.text = TimeOfDay.now().format(context).toString();
    endTimeController.text = TimeOfDay.now().format(context).toString();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode:autovalidateMode,
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

          DateField(dateController:dateController),

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

                    TimeField(timeController:startTimeController),
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

          ColorField( colorController: colorController),

          SizedBox(height: 70),
          CustomElevatedButton(
            buttonText: "Create Task",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              }
              else{
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {
                    
                  });
              }
            },
          ),
        ],
      ),
    );
  }
}
