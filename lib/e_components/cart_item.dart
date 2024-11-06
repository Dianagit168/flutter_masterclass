import 'package:flutter/material.dart';
import 'package:flutter_maserclass/e_model/cart_model.dart';
import 'package:flutter_maserclass/e_model/shoe_model.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final ShoeModel shoeModel;
  const CartItem({super.key, required this.shoeModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
          leading: Image.asset('${shoeModel.imageParth}'),
          title: Text('${shoeModel.name}'),
          subtitle: Text('${shoeModel.price}'),
          trailing: IconButton(
              onPressed: () {
                context.read<CartModel>().removeItemFromCart(shoeModel);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ))),
    );
  }
}
