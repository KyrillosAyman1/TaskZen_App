import 'package:flutter/material.dart';
import 'package:taskzen_app/constant.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "Hello, Kero",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: kPrimaryColor,
        ),
      ),
      subtitle: Text(
        "Have a nice day!",
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: IconButton(onPressed: () {}, icon: Icon(Icons.light_mode)),
      ),
    );
  }
}
