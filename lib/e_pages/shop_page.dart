import 'package:flutter/material.dart';
import 'package:flutter_maserclass/e_components/shoe_tile.dart';
import 'package:flutter_maserclass/e_model/cart_model.dart';
import 'package:flutter_maserclass/e_model/shoe_model.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    void addShoeToCart(ShoeModel shoe) {
      context.read<CartModel>().addItemToCart(shoe);
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Add Item Successfully!'),
            content: Text('Check Your Cart'),
          );
        },
      );
    }

    return Consumer<CartModel>(
      builder: (context, shoeList, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  'everyone flies.. some fly longer than others',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hot Pick',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: shoeList.getShoeList().length,
                  itemBuilder: (context, index) {
                    return ShoeTile(
                      shoeModel: shoeList.getShoeList()[index],
                      onTap: () => addShoeToCart(shoeList.getShoeList()[index]),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: Divider(
                  color: Colors.white,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
