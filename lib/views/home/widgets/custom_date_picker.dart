import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskzen_app/constant.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  String selectedDate = DateTime.now().toString();
  final DatePickerController _controller = DatePickerController();

  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpToSelection();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4,),
      child :  SizedBox(
        height: 100,
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: DatePicker(
            width: 70,
            DateTime.now().subtract(const Duration(days: 15)),
            initialSelectedDate: DateTime.now(),
            selectionColor: kPrimaryColor,
            selectedTextColor: Colors.white,
            controller: _controller,
            onDateChange: (date) {
              setState(() {
                selectedDate = date.toString();
               
              });
            },
            daysCount: 45 ,
          ),
        ),
      ),
    );
  }
}
