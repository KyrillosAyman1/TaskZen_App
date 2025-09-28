
import 'package:flutter/material.dart';
import 'package:taskzen_app/constant.dart' show kPrimaryColor;
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
     required this.onPressed,
      required this.buttonText,
    super.key,
  });
    final void Function()? onPressed;
    final String buttonText ;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        backgroundColor: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child:  Text(
        buttonText,
         
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
