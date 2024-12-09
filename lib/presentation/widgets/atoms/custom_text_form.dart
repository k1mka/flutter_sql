import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextForm extends HookWidget {
  const CustomTextForm({
    super.key,
    this.initValue,
    this.keyboardType,
    required this.labelText,
    required this.onChanged,
  });

  final String labelText;
  final String? initValue;
  final Function(String typedValue) onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: initValue);
    final errorText = useState<String?>(null);

    void validate(String value) {
      if (value.isEmpty) {
        errorText.value = 'error plug';
      } else {
        errorText.value = null;
      }
    }

    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (value) {
        validate(value);
        onChanged(value);
      },
      decoration: InputDecoration(
        labelText: labelText,
        errorText: errorText.value,
      ),
    );
  }
}
