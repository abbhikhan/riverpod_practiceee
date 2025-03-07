import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/cart_view_model.dart';

class CartScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
print('length of Data ${cart.length}');
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cart.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_shopping_cart),
              onPressed: () {
                ref.read(cartProvider.notifier).removeFromCart(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} removed from cart!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
