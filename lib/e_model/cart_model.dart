import 'package:flutter/material.dart';
import 'package:flutter_maserclass/e_model/shoe_model.dart';

class CartModel with ChangeNotifier {
  List<ShoeModel> shoeShop = [
    ShoeModel(
      name: 'Air Jordan',
      price: '1000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/air_joden.png',
    ),
    ShoeModel(
      name: 'Converse',
      price: '2000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/converse.png',
    ),
    ShoeModel(
      name: 'Zoom Freak',
      price: '3000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/zoom_freak.png',
    ),
    ShoeModel(
      name: 'Bull Kab Dav',
      price: '4000',
      description:
          'descAir Force Air Jordan Nike Sneakers White, jordan, white, outdoor Shoe,ription',
      imageParth: 'lib/images/bull.png',
    )
  ];

  List<ShoeModel> userCart = [];

  List<ShoeModel> getShoeList() {
    return shoeShop;
  }

  List<ShoeModel> getUserCart() {
    return userCart;
  }

  void addItemToCart(ShoeModel shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemFromCart(ShoeModel shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
