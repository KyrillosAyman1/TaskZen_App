import 'package:flutter/material.dart';
import 'package:taskzen_app/views/home/widgets/task_card.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 8),
        itemBuilder: (context, index) {
          return const TaskCard();
        },
      ),
    );
  }
}
