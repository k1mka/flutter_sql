import 'package:flutter/material.dart';

class CustomSwitchButton extends StatelessWidget {
  const CustomSwitchButton({
    super.key,
    required this.onChanged,
    required this.isSelected,
    required this.text,
  });

  final String text;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Switch(
          value: isSelected,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
