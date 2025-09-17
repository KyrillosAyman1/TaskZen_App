import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ListTile(
        
          title: Text(
            "Task 1",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  "This is a sample task description for the task card widget.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 5),
                  Text(
                    "9:00 AM - 10:00 AM",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ],
              ),
            ],
          ),

          trailing: 1 / 1 == 0
              ? Lottie.asset(
                  "assets/images/Trophy.json",
                  height: 100,
                  width: 70,
                  //fit: BoxFit.cover,
                  repeat: false,
                  alignment: Alignment.centerRight,
                )
              : Lottie.asset(
                  "assets/images/Cat playing animation.json",
                  height: 100,
                  width: 120,
                  repeat: false,
                 
                ),
        ),
      ),
    );
  }
}
