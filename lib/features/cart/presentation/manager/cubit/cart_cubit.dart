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
  final index = _cartItems.indexWhere((p) => p.id == product.id);

  if (index != -1) {
    // المنتج موجود: نحدّث الكمية بناءً على القيمة القادمة
    _cartItems[index] = _cartItems[index].copyWith(
      quantity: _cartItems[index].quantity + product.quantity,
    );
  } else {
    // منتج جديد: نضيفه كما هو
    _cartItems.add(product);
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
  num get totalPrice {
    num total = 0;
    for (final product in _cartItems) {
      total += (product.price) * (product.quantity);
    }
    return total;
  }
}