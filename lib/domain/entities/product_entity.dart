import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

part 'product_entity.g.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required String productName,
    required String description,
    required String price,
    required int stock,
    required bool isAvailable,
  }) = _ProductEntity;

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);
}
