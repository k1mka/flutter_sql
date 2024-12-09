import 'package:flutter_sql/data/data_sources/local/local_data_source.dart';
import 'package:flutter_sql/data/models/product_model.dart';
import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:flutter_sql/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl({required this.localDataSource});

  final LocalDataSource localDataSource;

  @override
  Future<List<ProductEntity>> getAllProducts() async {
    final models = await localDataSource.getAllProducts();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> saveProduct(ProductEntity product) async {
    final model = ProductModel.fromEntity(product);
    await localDataSource.saveProduct(model);
  }

  @override
  Future<void> deleteProduct(ProductEntity product) async {
    final model = ProductModel.fromEntity(product);
    await localDataSource.deleteProduct(model);
  }

  @override
  Future<void> updateProduct(ProductEntity product) async {
    final model = ProductModel.fromEntity(product);
    await localDataSource.updateProduct(model);
  }
}
