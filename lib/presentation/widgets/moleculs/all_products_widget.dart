import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/widgets/atoms/product_widget.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({
    super.key,
    required this.products,
    required this.onDeleteProduct,
    required this.onEditProduct,
  });

  final List<ProductEntity> products;

  final VoidCallback onEditProduct;
  final ValueChanged<ProductEntity> onDeleteProduct;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (_, int index) => Padding(
            padding: Spacings.padding4,
            child: ProductWidget(
              product: products[index],
              onEdit: onEditProduct,
              onDelete: () => onDeleteProduct(products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
