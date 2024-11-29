import 'package:flutter_sql/data/models/product_model.dart';

abstract interface class LocalDataSource {
  Future<void> saveProduct(ProductModel product);

  Future<List<ProductModel>> getAllProducts();
}
