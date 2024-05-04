import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void updateCartItemsAccordingTOLocale(List<Product> products) {
    _items.forEach((key, cartItem) {
      var product = products.firstWhere(
        (product) => product.id.toString() == key,
      );
      _items.update(
          key,
          (existingItem) => CartItem(
                id: existingItem.id,
                title: product.name,
                quantity: existingItem.quantity,
                price: product.price,
                category: product.category,
                picUrl: existingItem.picUrl,
              ));
    });
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, String title, double price, String picUrl,
      String category) {
    if (_items.containsKey(productId)) {
      // change quantity
      _items.update(
          productId,
          (existingItem) => CartItem(
                id: existingItem.id,
                title: existingItem.title,
                quantity: existingItem.quantity < 4
                    ? existingItem.quantity + quantity
                    : existingItem.quantity,
                price: existingItem.price,
                category: existingItem.category,
                picUrl: existingItem.picUrl,
              ));
      quantity = 1;
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          quantity: quantity,
          price: price,
          picUrl: picUrl,
          category: category,
        ),
      );
      quantity = 1;
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          quantity: existingItem.quantity - 1,
          price: existingItem.price,
          category: existingItem.category,
          picUrl: existingItem.picUrl,
        ),
      );
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  var quantity = 1;
  void addProductQuantity() {
    if (quantity >= 4) {
      return;
    }
    quantity += 1;
    notifyListeners();
  }

  void subProductQuantity() {
    if (quantity > 1) {
      quantity -= 1;
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void incrementItemQuantity(String productId) {
    CartItem? existingItem = _items[productId];

    // Check if the quantity is already 4
    if (existingItem!.quantity == 4) {
      // If the quantity is already 4, don't increment further

      return;
    }
    // change quantity
    _items.update(
        productId,
        (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity + 1,
              price: existingItem.price,
              category: existingItem.category,
              picUrl: existingItem.picUrl,
            ));

    notifyListeners();
  }

  void decrementItemQuantity(String productId) {
    CartItem? existingItem = _items[productId];

    // Check if the quantity is already 1
    if (existingItem!.quantity == 1) {
      // If the quantity is already 1, don't decrement further

      return;
    }
    // change quantity
    _items.update(
        productId,
        (existingItem) => CartItem(
              id: existingItem.id,
              title: existingItem.title,
              quantity: existingItem.quantity - 1,
              price: existingItem.price,
              category: existingItem.category,
              picUrl: existingItem.picUrl,
            ));

    notifyListeners();
  }
}
