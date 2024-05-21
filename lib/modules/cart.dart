import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: 'Zoom Freak',
      price: '234',
      imagePath: 'lib/images/PngItem_2441597 (1).png',
      description: 'The forward-thinking design of his latest signature shoe'
    ),
    Shoe(
      name: 'Air Jordan',
      price: '212',
      imagePath: 'lib/images/PngItem_419350.png',
      description: 'You\ve got the hops and the speed-lace up in shoe enhanced'
    ),
    Shoe(
      name: 'KD Treys',
      price: '222',
      imagePath: 'lib/images/PngItem_3578282.png',
      description: 'A secure midfoot strap is suited for scoring binges and defensive'
    ),
    Shoe(
      name: 'Kyrie 6',
      price: '154',
      imagePath: 'lib/images/PngItem_3577810.png',
      description: 'Bouncy cushioning is paired with soft yet supportive foam for res'
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get a list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addShoeToCart (Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items from cart
  void removeShoeFromCart (Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
