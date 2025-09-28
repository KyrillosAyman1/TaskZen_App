import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';

class DateField extends StatefulWidget {
  const DateField({super.key, required this.dateController});

  final TextEditingController dateController;

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    // لو فيه تاريخ محفوظ جوه الكنترولر نزبطه
    if (widget.dateController.text.isNotEmpty) {
      try {
        selectedDate = DateFormat(
          "dd-MM-yyyy",
        ).parse(widget.dateController.text);
      } catch (_) {
        selectedDate = DateTime.now(); // fallback لو حصل خطأ
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onChanged: (value) {
        widget.dateController.text = value;
      },
      controller: widget.dateController,
      readOnly: true,
      icon: Icons.calendar_month,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );
        if (pickedDate != null) {
          widget.dateController.text = DateFormat(
            "dd-MM-yyyy",
          ).format(pickedDate);
          selectedDate = pickedDate;
        }
      },
    );
  }
}
