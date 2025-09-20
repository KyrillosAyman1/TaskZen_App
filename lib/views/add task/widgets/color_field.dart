import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';

class ColorField extends StatelessWidget {
  const ColorField({super.key, required this.colorController});
  final TextEditingController colorController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          icon: Icons.color_lens,
          readOnly: true,
          controller: colorController,
          hint: "Click to Select color",
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: Colors.lightBlue,
                      onColorChanged: (value) {
                        colorController.text = value.value.toString();
                        
                      },
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Done"),
                    ),
                  ],
                );
              },
            );
          },
        ),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.lightBlue,
          child: IconButton(
            icon: Icon(Icons.check, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
