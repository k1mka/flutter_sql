import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomSwitchButton extends HookWidget {
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
    final localState = useState(isSelected);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Switch(
          value: localState.value,
          onChanged: (value) {
            localState.value = value;
            onChanged(value);
          },
        ),
      ],
    );
  }
}
