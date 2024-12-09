import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/widgets/atoms/product_modal_content.dart';
import 'package:flutter_sql/presentation/widgets/moleculs/all_products_widget.dart';
import 'package:flutter_sql/presentation/widgets/tokens/radiuses.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    super.key,
    required this.onCreateProduct,
    required this.onDeleteProduct,
    required this.onEditProduct,
    required this.products,
  });

  final List<ProductEntity> products;

  final VoidCallback onCreateProduct;
  final ValueChanged<ProductEntity> onDeleteProduct;
  final VoidCallback onEditProduct;

  static const _isScrollControlled = true;
  static const _buttonIcon = Icon(Icons.add);
  static const _borderRadius = RoundedRectangleBorder(borderRadius: Radiuses.borderRadius12);

  void editProduct({
    required BuildContext context,
    required ProductEntity product,
  }) =>
      showModalBottomSheet(
        context: context,
        shape: _borderRadius,
        isScrollControlled: _isScrollControlled,
        builder: (_) => ProductModalContent.edit(
          product,
          onEditProduct,
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          AllProductsWidget(
            products: products,
            onDeleteProduct: (product) => onDeleteProduct(product),
            onEditProduct: (product) => editProduct(context: context, product: product),
          ),
          Padding(
            padding: Spacings.padding16,
            child: FloatingActionButton(
              child: _buttonIcon,
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: _borderRadius,
                isScrollControlled: _isScrollControlled,
                builder: (_) => ProductModalContent.create(onCreateProduct),
              ),
            ),
          ),
        ],
      );
}
