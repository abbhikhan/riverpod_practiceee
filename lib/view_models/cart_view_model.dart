import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class CartViewModel extends StateNotifier<List<Product>> {
  CartViewModel() : super([]);

  void addToCart(Product product) {
    state = [...state, product];

  }

  void removeFromCart(Product product) {
    state = state.where((item) => item.id != product.id).toList();
  }
}

final cartProvider = StateNotifierProvider<CartViewModel, List<Product>>(
        (ref) => CartViewModel());


final containerColorProvider = StateProvider<Color>((ref) => Colors.white);

final messageProvider = Provider<String>((ref) {
  return " This is message.";
});
