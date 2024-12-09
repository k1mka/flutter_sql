import 'package:flutter_sql/presentation/main_screen/providers/product_modal_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'is_product_button_enabled_controller.g.dart';

@riverpod
bool isProductButtonEnabled(IsProductButtonEnabledRef ref) {
  final currentProduct = ref.watch(productModalControllerProvider);

  final result = currentProduct?.productName != null &&
      currentProduct?.description != null &&
      currentProduct?.stock != null &&
      currentProduct?.price != null;

  return result;
}
