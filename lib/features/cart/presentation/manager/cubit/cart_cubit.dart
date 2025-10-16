import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/cart/data/model/cart_model.dart';
import 'package:equatable/equatable.dart';
part 'cart_state.dart';


class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<CartModel> _cartItems = [];

  /// 🛒 كل المنتجات في الكارت
  List<CartModel> get cartItems => List.unmodifiable(_cartItems);

  /// 🔹 إضافة منتج للكارت
  void addToCart(CartModel product) {
    // لو المنتج موجود، نزود الكمية بدل إضافة جديد
    final index = _cartItems.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _cartItems[index] =
          _cartItems[index].copyWith(quantity: _cartItems[index].quantity + 1);
    } else {
      _cartItems.add(product.copyWith(quantity: 1));
    }
    emit(CartUpdated(List.from(_cartItems)));
  }

  /// 🔹 إزالة منتج بالكامل
  void removeFromCart(String productId) {
    _cartItems.removeWhere((p) => p.id == productId);
    emit(CartUpdated(List.from(_cartItems)));
  }

  /// 🔹 زيادة الكمية
  void increaseQuantity(String productId) {
    final index = _cartItems.indexWhere((p) => p.id == productId);
    if (index != -1) {
      _cartItems[index] =
          _cartItems[index].copyWith(quantity: _cartItems[index].quantity + 1);
      emit(CartUpdated(List.from(_cartItems)));
    }
  }

  /// 🔹 تقليل الكمية
  void decreaseQuantity(String productId) {
    final index = _cartItems.indexWhere((p) => p.id == productId);
    if (index != -1 && _cartItems[index].quantity > 1) {
      _cartItems[index] =
          _cartItems[index].copyWith(quantity: _cartItems[index].quantity - 1);
    } else if (index != -1) {
      _cartItems.removeAt(index);
    }
    emit(CartUpdated(List.from(_cartItems)));
  }

  /// 🔹 حساب الإجمالي
  double get totalPrice {
    double total = 0;
    for (final product in _cartItems) {
      total += (product.price ?? 0) * (product.quantity ?? 1);
    }
    return total;
  }
}