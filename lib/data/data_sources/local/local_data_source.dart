import 'package:flutter_sql/data/models/product_model.dart';

abstract interface class LocalDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<void> saveProduct(ProductModel product);

  Future<void> deleteProduct(ProductModel product);
}
