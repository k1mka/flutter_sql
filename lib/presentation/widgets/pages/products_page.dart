import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/widgets/atoms/product_modal_content.dart';
import 'package:flutter_sql/presentation/widgets/moleculs/all_products_widget.dart';
import 'package:flutter_sql/presentation/widgets/tokens/radiuses.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    required this.onCreateProduct,
    required this.onDeleteProduct,
    required this.onEditProduct,
    required this.products,
    super.key,
  });

  final VoidCallback onCreateProduct;
  final List<ProductEntity> products;

  final ValueChanged<ProductEntity> onDeleteProduct;
  final VoidCallback onEditProduct;

  static const _buttonIcon = Icon(Icons.add);
  static const _borderRadius = RoundedRectangleBorder(borderRadius: Radiuses.borderRadius12);

  @override
  Widget build(BuildContext context, WidgetRef ref) => Stack(
        alignment: Alignment.bottomRight,
        children: [
          AllProductsWidget(
            products: products,
            onDeleteProduct: (product) => onDeleteProduct(product),
            onEditProduct: onEditProduct,
          ),
          Padding(
            padding: Spacings.padding16,
            child: FloatingActionButton(
              child: _buttonIcon,
              onPressed: () => showModalBottomSheet(
                context: context,
                shape: _borderRadius,
                isScrollControlled: true,
                builder: (_) => ProductModalContent(
                  onCreateProduct: onCreateProduct,
                ),
              ),
            ),
          ),
        ],
      );
}
