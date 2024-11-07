import 'package:flutter/material.dart';
import 'package:flutter_maserclass/model/product_model.dart';

class ProduProvider with ChangeNotifier {
  final List<ProductModel> _shop = [
    ProductModel(
      name: 'Air Jordan',
      price: '1000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/air_joden.png',
    ),
    ProductModel(
      name: 'Converse',
      price: '2000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/converse.png',
    ),
    ProductModel(
      name: 'Zoom Freak',
      price: '3000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/zoom_freak.png',
    ),
    ProductModel(
      name: 'Bull Kab Dav',
      price: '4000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/bull.png',
    )
  ];

  final List<ProductModel> _userCart = [];

  List<ProductModel> get shop => _shop;

  List<ProductModel> get userCart => _userCart;

  void addItemToCart(ProductModel item) {
    _userCart.add(item);
    notifyListeners();
  }

  void removeItemFromCart(ProductModel item) {
    _userCart.remove(item);
    notifyListeners();
  }
}
