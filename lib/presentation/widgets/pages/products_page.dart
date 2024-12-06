import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/widgets/atoms/product_modal_content.dart';
import 'package:flutter_sql/presentation/widgets/atoms/product_widget.dart';
import 'package:flutter_sql/presentation/widgets/tokens/radiuses.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    required this.onCreateProduct,
    required this.products,
    super.key,
  });

  final VoidCallback onCreateProduct;
  final List<ProductEntity> products;

  static const _buttonIcon = Icon(Icons.add);
  static const _borderRadius = RoundedRectangleBorder(borderRadius: Radiuses.borderRadius12);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Padding(
          padding: Spacings.padding16,
          child: Align(
            alignment: Alignment.topCenter,
            child: Center(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: Spacings.padding4,
                  child: ProductWidget(product: products[index]),
                ),
              ),
            ),
          ),
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
}
