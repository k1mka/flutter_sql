import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/widgets/atoms/product_widget.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((data) => ProductWidget(productName: data.productName)).toList(),
    );
  }
}
