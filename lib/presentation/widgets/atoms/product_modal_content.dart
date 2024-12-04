import 'package:flutter/material.dart';
import 'package:flutter_sql/context_extensions.dart';
import 'package:flutter_sql/presentation/main_screen/providers/is_product_button_enabled_controller.dart';
import 'package:flutter_sql/presentation/main_screen/providers/product_modal_controller.dart';
import 'package:flutter_sql/presentation/widgets/atoms/custom_text_form.dart';
import 'package:flutter_sql/presentation/widgets/custom_switch_button.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductModalContent extends ConsumerWidget {
  const ProductModalContent({
    required this.onCreateProduct,
    super.key,
  });

  static const _spacer = Spacings.spacer16;

  final VoidCallback onCreateProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAvailable = ref.watch(productModalControllerProvider).isAvailable;
    final isAddProductButtonEnabled = ref.watch(isProductButtonEnabledProvider);
    return Padding(
      padding: Spacings.padding16,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.s.add_product,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            _spacer,
            CustomTextForm(
              labelText: context.s.product_name,
              onChanged: ref.read(productModalControllerProvider.notifier).updateProductName,
            ),
            _spacer,
            CustomTextForm(
              labelText: context.s.description,
              onChanged: ref.read(productModalControllerProvider.notifier).updateProductDescription,
            ),
            _spacer,
            CustomTextForm(
              labelText: context.s.price,
              keyboardType: TextInputType.number,
              onChanged: ref.read(productModalControllerProvider.notifier).updatePrice,
            ),
            _spacer,
            CustomTextForm(
              labelText: context.s.stock,
              keyboardType: TextInputType.number,
              onChanged: ref.read(productModalControllerProvider.notifier).updateStock,
            ),
            _spacer,
            CustomSwitchButton(
              isSelected: isAvailable,
              text: context.s.is_available,
              onChanged: ref.read(productModalControllerProvider.notifier).updateAvailable,
            ),
            _spacer,
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: isAddProductButtonEnabled ? onCreateProduct : null,
                child: Text(context.s.add_product),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
