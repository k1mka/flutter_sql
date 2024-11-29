import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}
