import 'package:e_commerce_app/components/shoe_tile.dart';
import 'package:e_commerce_app/modules/cart.dart';
import 'package:e_commerce_app/modules/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart (Shoe shoe) {
    // add shoe to cart
    Provider.of<Cart>(context, listen: false).addShoeToCart(shoe);
    // alert the user, shoe successfully added
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.greenAccent,
        title: Text('Successfully added!'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16),
        child: Column(
          children: [
            // message
            Text(
              'Everyone flies... some fly longer than others',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
            const SizedBox(
              height: 24,
            ),

            // search bar
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SearchBar(
                hintText: 'Search kicks',
                hintStyle: MaterialStatePropertyAll(TextStyle(
                  color: Colors.grey.shade500,
                )),
                trailing: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search_rounded))
                ],
                shadowColor: MaterialStatePropertyAll(Colors.grey.shade300),
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            // hotpicks
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hot Picks 🔥',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 32,
                    child: const Text(
                      'View all',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // get a shoe from shoe list
                Shoe shoe = value.getShoeList()[index];
                
                // return shoe from list
                return ShoeTile(
                  shoe: shoe,
                  onTap: () => addShoeToCart(shoe),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
