import 'package:e_commerce_app/Pages/cart_page.dart';
import 'package:e_commerce_app/Pages/shop_page.dart';
import 'package:e_commerce_app/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNav = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _currentNav = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNav(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu_rounded)),
          )),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // logo
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80, bottom: 24),
                    child: SizedBox(
                      height: 100, // Adjust the height as needed
                      child: Image.asset(
                        'lib/images/nike new.png',
                        color: Colors.white,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Divider(thickness: 1, color: Colors.grey.shade800,),
                  const SizedBox(height: 24,),
                          
                  // other pages
                  ListTile(
                    leading: Icon(
                          Icons.home_rounded, 
                          color: Colors.grey.shade500,
                        ),
                    title: Text(
                          'Shop',
                          style: TextStyle(
                            color: Colors.grey.shade200
                          ),
                        ),
                  ),
                  ListTile(
                    leading: Icon(
                          Icons.shopping_bag_rounded, 
                          color: Colors.grey.shade500,
                        ),
                    title: Text(
                          'Cart',
                          style: TextStyle(
                            color: Colors.grey.shade200
                          ),
                        ),
                  ),
                  ListTile(
                    leading: Icon(
                          Icons.info_rounded, 
                          color: Colors.grey.shade500,
                        ),
                    title: Text(
                          'About',
                          style: TextStyle(
                            color: Colors.grey.shade200
                          ),
                        ),
                  ),
                ],
              ),
              ListTile(
                // onTap: () => /intropage,
                leading: Icon(
                      Icons.logout_rounded, 
                      color: Colors.grey.shade500,
                    ),
                title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.grey.shade200
                      ),
                    ),
              ),
            ],
          ),
        ),
        
      ),
      body: _pages[_currentNav],
    );
  }
}
