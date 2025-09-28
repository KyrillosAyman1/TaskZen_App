import 'package:flutter/material.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';

class TimeField extends StatelessWidget {
  const TimeField({super.key, required this.timeController});

  final TextEditingController timeController;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (value) {
        timeController.text = value;
      },
      icon: Icons.access_time_sharp,
      controller: timeController,
      readOnly: true,
      onTap: () async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          // ignore: use_build_context_synchronously
          timeController.text = pickedTime.format(context).toString();
        }
      },
    );
  }
}
