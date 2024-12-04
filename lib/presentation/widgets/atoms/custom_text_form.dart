import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    super.key,
    required this.labelText,
    this.keyboardType,
    required this.onChanged,
  });

  final String labelText;
  final Function(String typedValue) onChanged;

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    );
  }
}
