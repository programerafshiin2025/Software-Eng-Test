import 'package:flutter/material.dart';
import 'package:shopping_app/data/globalvariable.dart';
import 'package:shopping_app/pages/products_cart.dart';
import 'package:shopping_app/pages/products_details_page.dart';
import 'package:shopping_app/pages/productslist.dart';

import 'cartpage.dart';
import 'details.dart';

class ShoesApp extends StatefulWidget {
  ShoesApp({super.key});

  @override
  State<ShoesApp> createState() => _ShoesAppState();
}

class _ShoesAppState extends State<ShoesApp> {
  int currentpage = 0;
  List<Widget> pages = [
    Productslist(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 35,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex: currentpage,
          onTap: (value) {
            setState(() {
              currentpage = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "")
          ]),
    );
  }
}

class providerShoes extends ChangeNotifier {
  List<Product> cartlist = [];
  void funcshoes(Product value) {
    cartlist.add(value);
    notifyListeners();
  }
}
