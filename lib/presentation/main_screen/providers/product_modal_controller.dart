import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_modal_controller.g.dart';

// TODO(George): rename controller

@riverpod
class ProductModalController extends _$ProductModalController {
  @override
  ProductEntity build() => ProductEntity.mock();

  void updateProductName(String name) {
    state = state.copyWith(productName: name);
  }

  void updateProductDescription(String description) {
    state = state.copyWith(description: description);
  }

  void updatePrice(String price) {
    final parsedPrice = double.parse(price);
    state = state.copyWith(price: parsedPrice);
  }

  void updateStock(String stock) {
    final parsedStock = int.parse(stock);
    state = state.copyWith(stock: parsedStock);
  }

  void updateAvailable(bool isAvailable) {
    state = state.copyWith(isAvailable: isAvailable);
  }
}
