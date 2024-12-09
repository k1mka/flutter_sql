import 'package:flutter/material.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_modal_controller.g.dart';

@riverpod
class ProductModalController extends _$ProductModalController {
  @override
  ProductEntity build() => ProductEntity.mock();

  void initCurrentProduct(ProductEntity? product) async {
    if (product == null) return;
    state = product;
  }

  void updateProductName(String name) {
    state = state?.copyWith(productName: name);
  }

  void updateProductDescription(String description) {
    state = state?.copyWith(description: description);
  }

  void updateAvailable(bool isAvailable) {
    state = state?.copyWith(isAvailable: isAvailable);
  }

  void updatePrice(String price) {
    if (_isNumeric(price)) {
      final parsedPrice = double.parse(price);
      state = state?.copyWith(price: parsedPrice);
    } else {
      debugPrint("Invalid input: $price");
    }
  }

  void updateStock(String stock) {
    if (_isNumeric(stock)) {
      final parsedStock = int.tryParse(stock) ?? 0;
      state = state?.copyWith(stock: parsedStock);
    } else {
      debugPrint("Invalid input: $stock");
    }
  }

  bool _isNumeric(String str) {
    final numericRegex = RegExp(r'^-?\d+(\.\d+)?$');
    return numericRegex.hasMatch(str);
  }
}
