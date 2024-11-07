import 'package:flutter/material.dart';
import 'package:flutter_maserclass/model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
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
        children: [
          const Icon(Icons.favorite),
          Text('${productModel.name}'),
          Text('${productModel.name}'),
          Text('${productModel.name}')
        ],
      ),
    );
  }
}
