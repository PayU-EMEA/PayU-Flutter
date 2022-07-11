import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  String get id => name;

  final String name;
  final int unitPrice;
  final int quantity;

  int get price => unitPrice * quantity;

  const Product({
    required this.name,
    required this.unitPrice,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  factory Product.futomaki() => const Product(name: 'Futomaki', unitPrice: 1999, quantity: 0);

  factory Product.napkin() => const Product(name: 'Napkin', unitPrice: 49, quantity: 0);

  factory Product.set30pcs() => const Product(name: 'Set', unitPrice: 9999, quantity: 0);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  Product copyWith({String? name, int? unitPrice, int? quantity}) {
    return Product(
      name: name ?? this.name,
      unitPrice: unitPrice ?? this.unitPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  String toString() => '[$runtimeType]: ${toJson().toString()}';

  @override
  List<Object?> get props => [id];
}
