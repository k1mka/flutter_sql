import 'package:flutter/material.dart';
import 'package:flutter_sql/context_extensions.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/widgets/tokens/radiuses.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductEntity product;

  static const _productTextStyles = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static const _fieldStyles = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const _size = 100.0;

  Color get isAvailableColor => product.isAvailable ? Colors.green.shade200 : Colors.grey.shade400;

  @override
  Widget build(BuildContext context) {
    final productName = '${context.s.product_name}: ${product.productName}';
    final description = '${context.s.description}: ${product.description}';
    final price = '${context.s.price}: ${product.price}';
    final stock = '${context.s.stock}: ${product.stock}';
    return Container(
      height: _size,
      decoration: BoxDecoration(
        color: isAvailableColor,
        borderRadius: Radiuses.borderRadius4,
      ),
      child: Padding(
        padding: Spacings.padding6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: _productTextStyles,
            ),
            Spacings.spacer4,
            Text(
              description,
              style: _fieldStyles,
            ),
            Spacings.spacer4,
            Text(
              price,
              style: _fieldStyles,
            ),
            Spacings.spacer4,
            Text(
              stock,
              style: _fieldStyles,
            ),
          ],
        ),
      ),
    );
  }
}
