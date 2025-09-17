import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:taskzen_app/constant.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child :  SizedBox(
        height: 100,
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: DatePicker(
            width: 70,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: kPrimaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {
                selectedDate = date;
              });
            },
            daysCount: 30,
          ),
        ),
      ),
    );
  }
}
