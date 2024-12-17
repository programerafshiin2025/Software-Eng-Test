import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/globalvariable.dart';
import 'package:shopping_app/provider/shoesProvider.dart';

class ProductsPage extends StatefulWidget {
  final int data;

  const ProductsPage({
    super.key,
    required this.data,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int? selectSize;

  @override
  Widget build(BuildContext context) {
    return Consumer<shoesprovider>(
      builder: (context, kheyr, child) => Scaffold(
        appBar: AppBar(
          title: Text("Details Page"),
        ),
        body: Column(
          children: [
            Text(
              products[widget.data].title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(products[widget.data].imageUrl),
            ),
            Spacer(
              flex: 2,
            ),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(245, 247, 249, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$${products[widget.data].price}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products[widget.data].sizes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: selectSize == index
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Chip(
                                      backgroundColor: Colors.amber,
                                      label: Text(
                                          "${products[widget.data].sizes[index]}")),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectSize = index;
                                    });
                                  },
                                  child: Chip(
                                      backgroundColor:
                                          Color.fromRGBO(245, 247, 249, 1),
                                      label: Text(
                                          "${products[widget.data].sizes[index]}")),
                                ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(241, 227, 21, 1),
                            minimumSize: Size(double.infinity, 50)),
                        onPressed: () {
                          kheyr.addCart(products[widget.data]);
                        },
                        icon: Icon(Icons.shopping_basket_sharp),
                        label: Text(
                          "Add To Carts",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
