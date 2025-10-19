import 'package:e_commerce/features/home/data/model/product/ProductModel.dart';

class CartModel {
  final String id;
  final String title;
  final String imageCover;
  final num price;
  final int quantity;

  const CartModel({
    required this.id,
    required this.title,
    required this.imageCover,
    required this.price,
    this.quantity = 1, // 👈 قيمة افتراضية
  });

  /// 🌀 إنشاء CartModel من ProductModel
  factory CartModel.fromProduct(ProductModel product, int quantity) {
    return CartModel(
      id: product.id ?? '',
      title: product.title ?? '',
      imageCover: product.imageCover ?? '',
      price: product.price ?? 0.0,
      quantity: quantity,
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

  /// 🧮 دالة لحساب السعر الكلي
  num get totalPrice => price * quantity;
}
