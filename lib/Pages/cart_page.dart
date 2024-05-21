import 'package:e_commerce_app/components/cart_item.dart';
import 'package:e_commerce_app/modules/cart.dart';
import 'package:e_commerce_app/modules/shoe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              // heading
              Row(
                children: [
                  const Text(
                    'My Cart ', 
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const Text(
                    '(',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    value.getUserCart().length.toString(),
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Text(
                    ')',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16,),
              
              // shoes in cart
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: value.getUserCart().length,
                  itemBuilder: (context, index) {
                    Shoe individualShoe = value.getUserCart()[index];
                    return CartItem(shoe: individualShoe,);
                  }
                ),
              )
          
            ]
          ),
        )
      )
    );
  }
}