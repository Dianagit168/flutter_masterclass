import 'package:flutter/material.dart';
import 'package:flutter_maserclass/model/product_model.dart';
import 'package:flutter_maserclass/model/shop_provider.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    void addToCart() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('Add this item to your cart?'),
            actions: [
              MaterialButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<ProduProvider>().addItemToCart(productModel);
                  Navigator.pop(context);
                },
                child: const Text('Yes'),
              )
            ],
          );
        },
      );
    }

    return Container(
      width: 300,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(
            12,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Image.asset(productModel.imageParth!),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            '${productModel.name}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text('${productModel.description}',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productModel.price}'),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)),
                child: IconButton(
                  onPressed: addToCart,
                  icon: const Icon(Icons.add),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
