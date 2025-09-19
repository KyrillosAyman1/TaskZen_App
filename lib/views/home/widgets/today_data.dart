import 'package:flutter/material.dart';
import 'package:taskzen_app/views/add%20task/add_task_view.dart';
import 'package:taskzen_app/widgets/custom_elevated_button.dart';

class TodayData extends StatelessWidget {
  const TodayData({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "September 20, 2024",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: const Text(
        "Saturday",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: CustomElevatedButton(
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTaskView()),
        );
      },
      ),
    );
  }
}

