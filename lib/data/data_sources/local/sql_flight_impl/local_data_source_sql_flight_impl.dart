import 'package:flutter_sql/data/data_sources/local/local_data_source.dart';
import 'package:flutter_sql/data/data_sources/local/sql_flight_impl/data_base_helper.dart';
import 'package:flutter_sql/data/models/product_model.dart';

class LocalDataSourceSqlFlightImpl implements LocalDataSource {
  final dbHelper = DatabaseHelper.instance;

  @override
  Future<void> saveProduct(ProductModel product) async => dbHelper.insert(product.toJson());

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final products = await dbHelper.queryAllRows();
    final result = products.map((product) => ProductModel.fromJson(product)).toList();
    return result;
  }
}
