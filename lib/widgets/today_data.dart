import 'package:flutter/material.dart';
import 'package:taskzen_app/constant.dart';

class TodayData extends StatelessWidget {
  const TodayData({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: const Text(
        "September 20, 2024",
        style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle:const  Text(
        "Saturday",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding:const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child:const Text(
          "+ Add Task",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
