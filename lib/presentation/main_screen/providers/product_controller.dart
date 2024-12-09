import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/presentation/main_screen/providers/product_modal_controller.dart';
import 'package:flutter_sql/service_locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_controller.g.dart';

@riverpod
class ProductController extends _$ProductController {
  @override
  Future<List<ProductEntity>> build() async {
    // TODO(George): add store later
    final products = await repository.getAllProducts();
    return products;
  }

  Future<void> updateProduct() async {
    final currentProduct = ref.read(productModalControllerProvider);
    await repository.updateProduct(currentProduct!);
    ref.invalidateSelf();
  }

  Future<void> deleteProduct(ProductEntity product) async {
    await repository.deleteProduct(product);
    ref.invalidateSelf();
  }

  Future<void> addNewProduct() async {
    final currentProduct = ref.read(productModalControllerProvider);
    await repository.saveProduct(currentProduct!);
    ref.invalidateSelf();
  }
}
