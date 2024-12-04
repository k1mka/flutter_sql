import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String productName,
    required String description,
    required double price,
    required int stock,
    required bool isAvailable,
  }) = _ProductEntity;

  static ProductEntity mock() {
    return const ProductEntity(
      productName: '',
      description: '',
      price: 0.0,
      stock: -1,
      isAvailable: false,
    );
  }

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);
}

