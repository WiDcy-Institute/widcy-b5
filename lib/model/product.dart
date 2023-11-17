import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {

  String? id;
  String? name;
  String? price;
  String? image;

  Product(this.id, this.name, this.price, this.image);

  factory Product.fromJson(Map<String,dynamic> json) => _$ProductFromJson(json);

  Map<String,dynamic> toJson() => _$ProductToJson(this);
}