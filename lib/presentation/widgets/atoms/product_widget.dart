import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(
      productName,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.black,
      ),
    );
  }
}
