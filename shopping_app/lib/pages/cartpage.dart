import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/globalvariable.dart';
import 'package:shopping_app/provider/shoesProvider.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<shoesprovider>(
      builder: (context, khayr, child) => Scaffold(
        appBar: AppBar(
          title: Text("Cart Page"),
        ),
        body: ListView.builder(
          itemCount: khayr.cartList.length,
          itemBuilder: (BuildContext context, index) {
            final cartitem = index;

            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(khayr.cartList[index].imageUrl),
              ),
              title: Text(khayr.cartList[index].title),
              trailing: GestureDetector(
                onTap: () {
                  khayr.RemoveCart(khayr.cartList[index]);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              subtitle: Text(khayr.cartList[index].sizes[index].toString()),
            );
          },
        ),
      ),
    );
  }
}
