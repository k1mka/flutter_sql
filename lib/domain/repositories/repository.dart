import 'package:flutter_sql/domain/entities/product_entity.dart';

abstract interface class Repository {
  Future<void> saveProduct(ProductEntity product);

  Future<List<ProductEntity>> getAllProducts();

  Future<void> deleteProduct(ProductEntity product);
}
