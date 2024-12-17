import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/globalvariable.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.currentindex});
  final int currentindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("Details"),
              SizedBox(
                height: 20,
              ),
              Text(products[currentindex].title),
              Image.asset(products[currentindex].imageUrl)
            ],
          ),
        ),
      ),
    );
  }
}
