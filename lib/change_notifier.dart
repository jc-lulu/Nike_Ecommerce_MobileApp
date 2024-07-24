import 'package:flutter/material.dart';

class ShoeItem {
  final String name;
  final String price;
  final String category;
  final String imageUrl;

  ShoeItem({
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });
}

class ShoeModel extends ChangeNotifier {
  final List<ShoeItem> _likedItems = [];
  final List<ShoeItem> _cartItems = [];

  List<ShoeItem> get likedItems => _likedItems;
  List<ShoeItem> get cartItems => _cartItems;

  void addToLiked(ShoeItem item) {
    _likedItems.add(item);
    notifyListeners();
  }

  void removeFromLiked(ShoeItem item) {
    _likedItems.remove(item);
    notifyListeners();
  }

  void addToCart(ShoeItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(ShoeItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
