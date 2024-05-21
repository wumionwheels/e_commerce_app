import 'package:e_commerce_app/modules/cart.dart';
import 'package:e_commerce_app/modules/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({
    super.key,
    required this.shoe,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {

  void removeShoeFromCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeShoeFromCart(shoe);
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.greenAccent,
        title: Text('Successfully removed!'),
        content: Text('You have successfully removed item from cart'),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      margin: const EdgeInsets.only(bottom: 16),
    
      decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(16),
    ),
      child: ListTile(
        
        minVerticalPadding: 8,
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        subtitleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade900
        ),
        trailing: IconButton(onPressed: () => removeShoeFromCart(widget.shoe), 
          icon: Icon(
            Icons.delete_rounded, 
            color: Colors.red,
          )
        ),
      ),
    );
  }
}