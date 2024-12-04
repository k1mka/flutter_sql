import 'package:flutter_sql/domain/entities/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String productName,
    required String description,
    required double price,
    required int stock,
    required bool isAvailable,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      productName: entity.productName,
      description: entity.description,
      price: entity.price,
      stock: entity.stock,
      isAvailable: entity.isAvailable,
    );
  }
}

extension ProductModelExt on ProductModel {
  ProductEntity toEntity() => ProductEntity(
        productName: productName,
        description: description,
        price: price,
        stock: stock,
        isAvailable: isAvailable,
      );
}
