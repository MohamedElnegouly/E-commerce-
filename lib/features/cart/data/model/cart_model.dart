import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';

class CartModel {
  final String? id;
  final String? title;
  final String? imageCover;
  final double? price;
  final int quantity;

  CartModel({
    this.id,
    this.title,
    this.imageCover,
    this.price,
    this.quantity = 1,
  });
/// 🌀 إنشاء CartModel من ProductModel
  factory CartModel.fromProduct(ProductModel product) {
    return CartModel(
      id: product.id ?? '',
      title: product.title ?? '',
      imageCover: product.imageCover ?? '',
      price: product.price?.toDouble() ?? 0.0,
      quantity: 1,
    );
  }

  CartModel copyWith({
    String? id,
    String? title,
    String? imageCover,
    double? price,
    int? quantity,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      imageCover: imageCover ?? this.imageCover,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
