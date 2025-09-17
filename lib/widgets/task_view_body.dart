
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskzen_app/constant.dart';
import 'package:taskzen_app/widgets/custom_app_bar.dart';
import 'package:taskzen_app/widgets/custom_date_picker.dart';
import 'package:taskzen_app/widgets/task_card.dart';
import 'package:taskzen_app/widgets/today_data.dart';

class TaskViewBody extends StatefulWidget {
  const TaskViewBody({super.key});

  @override
  State<TaskViewBody> createState() => _TaskViewBodyState();
}
 
class _TaskViewBodyState extends State<TaskViewBody> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children:   [
        SizedBox(height: 20,),
        CustomAppBar(),
        TodayData(),
         CustomDatePicker(),
         TaskCard()
        
      ],
    );
  }
}

