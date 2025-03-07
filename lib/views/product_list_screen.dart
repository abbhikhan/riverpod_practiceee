import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../view_models/cart_view_model.dart';
 import 'cart_screen.dart';

class ProductListScreen extends ConsumerWidget {

  final List<Product> products = [
    Product(id: 1, name: 'Laptop', price: 1000),
    Product(id: 2, name: 'Smartphone', price: 500),
    Product(id: 3, name: 'watch', price: 20),
    Product(id: 4, name: 'ring', price: 300),
   ];

  @override
  Widget build(BuildContext context, ref) {
    final message = ref.watch(messageProvider);
    final containerColor = ref.watch(containerColorProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(message),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartScreen()),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
            
                return Column(
                  children: [
                    ListTile(
                      title: Text(product.name),
                      subtitle: Text('\$${product.price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          print('pressed');
                          ref.read(cartProvider.notifier).addToCart(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${product.name} added to cart!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ),
            
            
            
                  ],
                );
              },
            ),
          ),

          GestureDetector(
            onTap: () {
              print('pressed');
              ref.watch(containerColorProvider.notifier).state = containerColor == Colors.white ? Colors.blue : Colors.red;
             },
            child: Container(
              height: 40,
              width: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:containerColor,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
          SizedBox(height: 120),
        ],
      ),
    );
  }
}
