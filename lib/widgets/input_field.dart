import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String hint;
  final bool isDouble;
  final bool isUpdate;
  final TextEditingController? controller;

  const InputField(
      {super.key,
      required this.title,
      required this.hint,
      required this.isDouble,
      required this.isUpdate,
      this.controller,
      });


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(title, style: const TextStyle(fontSize: 16)),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
          ),
          autofocus: false,
          controller: controller,
          keyboardType: isDouble == true ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.name,
        ),
      ],
    );
  }
}
