import 'package:flutter/material.dart';
import 'package:flutter_maserclass/components/my_button.dart';
import 'package:flutter_maserclass/model/product_model.dart';
import 'package:flutter_maserclass/model/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartData = context.watch<ProduProvider>().userCart;
    void removeFromCart(ProductModel productToRemove) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('Do you want to remome item cart?'),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  context
                      .read<ProduProvider>()
                      .removeItemFromCart(productToRemove);
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              )
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        title: const Text('My Cart'),
      ),
      body: cartData.isEmpty
          ? const Center(
              child: Text('Your cart is empty...'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text('${cartData[index].name}'),
                        title: Text('${cartData[index].price}'),
                        trailing: IconButton(
                            onPressed: () {
                              removeFromCart(cartData[index]);
                            },
                            icon: const Icon(Icons.remove)),
                      );
                    },
                  ),
                ),
                MyButton(
                  onTap: () {},
                  text: 'Pay Now!',
                )
              ],
            ),
    );
  }
}
