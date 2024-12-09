import 'package:flutter/material.dart';
import 'package:flutter_sql/context_extensions.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/main_screen/providers/is_product_button_enabled_controller.dart';
import 'package:flutter_sql/presentation/main_screen/providers/product_modal_controller.dart';
import 'package:flutter_sql/presentation/widgets/atoms/custom_text_form.dart';
import 'package:flutter_sql/presentation/widgets/custom_switch_button.dart';
import 'package:flutter_sql/presentation/widgets/tokens/spacings.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductModalContent extends ConsumerStatefulWidget {
  final bool isEditMode;
  final ProductEntity? currentProduct;
  final VoidCallback onCreateOrEdit;

  const ProductModalContent._({
    this.currentProduct,
    required this.onCreateOrEdit,
    required this.isEditMode,
  });

  static const _spacer = Spacings.spacer16;

  factory ProductModalContent.create(VoidCallback onPressed) {
    return ProductModalContent._(
      isEditMode: false,
      onCreateOrEdit: onPressed,
    );
  }

  factory ProductModalContent.edit(
    ProductEntity currentProduct,
    VoidCallback onPressed,
  ) {
    return ProductModalContent._(
      isEditMode: true,
      onCreateOrEdit: onPressed,
      currentProduct: currentProduct,
    );
  }

  @override
  ConsumerState<ProductModalContent> createState() => _ProductModalContentState();
}

class _ProductModalContentState extends ConsumerState<ProductModalContent> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initProduct();
  }

  void initProduct() {
    final bool isInit = widget.isEditMode && widget.currentProduct != null;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (isInit) {
          ref.read(productModalControllerProvider.notifier)
              .initCurrentProduct(widget.currentProduct);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAddProductButtonEnabled = ref.watch(isProductButtonEnabledProvider);

    return Padding(
      padding: Spacings.padding16,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.isEditMode ? context.s.edit_product : context.s.add_product,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ProductModalContent._spacer,
            CustomTextForm(
              initValue: widget.currentProduct?.productName,
              labelText: context.s.product_name,
              onChanged: ref.read(productModalControllerProvider.notifier).updateProductName,
            ),
            ProductModalContent._spacer,
            CustomTextForm(
              initValue: widget.currentProduct?.description,
              labelText: context.s.description,
              onChanged: ref.read(productModalControllerProvider.notifier).updateProductDescription,
            ),
            ProductModalContent._spacer,
            CustomTextForm(
              initValue: widget.currentProduct?.price.toString(),
              labelText: context.s.price,
              keyboardType: TextInputType.number,
              onChanged: ref.read(productModalControllerProvider.notifier).updatePrice,
            ),
            ProductModalContent._spacer,
            CustomTextForm(
              initValue: widget.currentProduct?.stock.toString(),
              labelText: context.s.stock,
              keyboardType: TextInputType.number,
              onChanged: ref.read(productModalControllerProvider.notifier).updateStock,
            ),
            ProductModalContent._spacer,
            CustomSwitchButton(
              isSelected: widget.currentProduct?.isAvailable ?? false,
              text: context.s.is_available,
              onChanged: ref.read(productModalControllerProvider.notifier).updateAvailable,
            ),
            ProductModalContent._spacer,
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: isAddProductButtonEnabled ? widget.onCreateOrEdit : null,
                child: Text(
                  widget.isEditMode ? context.s.edit_product : context.s.add_product,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
