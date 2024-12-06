import 'package:flutter/material.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';

class ProductActionsWrapper extends StatelessWidget {
  const ProductActionsWrapper({
    super.key,
    required this.editProduct,
    required this.onDeleteProduct,
    required this.child,
  });

  final Widget child;
  final VoidCallback editProduct;
  final VoidCallback onDeleteProduct;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        child,
        Padding(
          padding: Spacings.padding8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onDeleteProduct,
                child: const Icon(Icons.delete),
              ),
              Spacings.spacer8,
              GestureDetector(
                onTap: editProduct,
                child: const Icon(Icons.edit),
              ),
            ],
          ),
        )
      ],
    );
  }
}
