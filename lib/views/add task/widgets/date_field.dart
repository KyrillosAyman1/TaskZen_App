
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';

class DateField extends StatelessWidget {
  const DateField({
    super.key,
    required this.dateController,
  });

  final TextEditingController dateController;

  @override

  Widget build(BuildContext context) {
    return CustomTextField(
      controller: dateController,
      readOnly: true,
      icon: Icons.calendar_month,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          dateController.text = DateFormat(
            "dd-MM-yyyy",
          ).format(pickedDate);
        }
      },
    );
  }
}
