import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';

class ColorField extends StatefulWidget {
  const ColorField({super.key, required this.colorController});
  final TextEditingController colorController;

  @override
  State<ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends State<ColorField> {
  
  @override
  Widget build(BuildContext context) {
    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          onChanged: (value) {
            widget.colorController.text = value;
          },
          icon: Icons.color_lens,
          readOnly: true,
          controller: widget.colorController,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: BlockPicker(
                      pickerColor: Color(int.parse(widget.colorController.text)),
                      onColorChanged: (value) {
                        widget.colorController.text = value.value.toString();
                        
                      },
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
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
          backgroundColor: widget.colorController.text.isEmpty
              ? Colors.lightBlue
              : Color(int.parse(widget.colorController.text)),
          child: IconButton(
            icon: Icon(Icons.check, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
