import 'package:flutter/material.dart';
import 'package:shopping_app/data/globalvariable.dart';
import 'package:shopping_app/pages/products_cart.dart';
import 'package:shopping_app/pages/products_details_page.dart';

class Productslist extends StatefulWidget {
  const Productslist({super.key});

  @override
  State<Productslist> createState() => _ProductslistState();
}

class _ProductslistState extends State<Productslist> {
  List<String> name = [
    "Omar",
    'Mohamed',
    "Kheyre",
    "Abdirahman",
    "Abdullahi",
    "Abdimajid",
    "Salax",
    "Munasar",
    "Yaxye Fardi",
  ];
  late String selectname;
  @override
  void initState() {
    super.initState();
    selectname = name[0];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Shoes \n Collections",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: name.length,
                itemBuilder: (BuildContext context, int index) {
                  final filter = name[index];
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectname = filter;
                        });
                      },
                      child: Chip(
                        backgroundColor: selectname == filter
                            ? Colors.blue
                            : const Color.fromRGBO(245, 247, 249, 1),
                        side: const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        label: Text(name[index]),
                        labelStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final Product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsPage(data: index),
                          ));
                    },
                    child: ProductCard(
                      title: Product.title,
                      price: Product.price,
                      image: Product.imageUrl,
                      backround: index.isEven
                          ? const Color.fromRGBO(216, 240, 250, 1)
                          : Color.fromRGBO(245, 247, 249, 1),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
