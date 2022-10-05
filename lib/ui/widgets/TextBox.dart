import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  TextBox(
    this.controller,
    this.label,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: this.controller,
        decoration: InputDecoration(
            filled: true,
            labelText: this.label,
            suffix: GestureDetector(
              child: const Icon(Icons.close),
              onTap: () {
                controller.clear();
              },
            )),
      ),
    );
  }
}
