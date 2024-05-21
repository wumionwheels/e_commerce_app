// ignore_for_file: unnecessary_import

import 'package:e_commerce_app/modules/shoe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // shoe image
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            height: 216,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: Image.asset(shoe.imagePath),
          ),

          //   name + price + description
          // name
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shoe.name,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.w600),
                ),

                const SizedBox(
                  height: 8,
                ),
                // name
                Text(
                  shoe.description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 24),
                child: Text(
                  shoe.price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey.shade900),
                ),
              ),
              // add to cart button
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      )),
                  child: const Icon(
                    Icons.add_rounded,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
