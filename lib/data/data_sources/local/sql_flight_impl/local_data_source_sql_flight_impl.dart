import 'dart:math';
import 'package:flutter_sql/data/data_sources/local/local_data_source.dart';
import 'package:flutter_sql/data/data_sources/local/sql_flight_impl/data_base_helper.dart';
import 'package:flutter_sql/data/models/product_model.dart';

class LocalDataSourceSqlFlightImpl implements LocalDataSource {
  final _dbHelper = DatabaseHelper.instance;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final products = await _dbHelper.queryAllRows();
    final result = products.map((product) => ProductModel.fromJson(product)).toList();
    return result;
  }

  @override
  Future<void> saveProduct(ProductModel product) async {
    final productData = product.toJson();
    productData[DatabaseHelper.columnId] = _generateRandomId();
    await _dbHelper.insert(productData);
  }

  /// generate a unique id before inserting
  int _generateRandomId() {
    final randomId = Random().nextInt(10000);
    return randomId;
  }

  @override
  Future<void> deleteProduct(ProductModel product) async => await _dbHelper.delete(product.id);

  @override
  Future<void> updateProduct(ProductModel product) async {
    await _dbHelper.update(
      product.id,
      product.toJson(),
    );
  }
}
