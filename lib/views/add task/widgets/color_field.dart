import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:taskzen_app/views/add%20task/widgets/custom_text_field.dart';

class ColorField extends StatefulWidget {
 const  ColorField({
    super.key,
    required this.colorController,
    required this.selectedColor,
    required this.onColorSelected,
  });
  final TextEditingController colorController;
  final  int selectedColor;
  final Function(int) onColorSelected;
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
                      pickerColor: Color(widget.selectedColor),
                      onColorChanged: (value) {
                        // ignore: deprecated_member_use
                        // widget.colorController.text = value.value.toString();
                        // ignore: deprecated_member_use
                        widget.onColorSelected(value.value);
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
              : Color(widget.selectedColor),
          child: IconButton(
            icon: Icon(Icons.check, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
