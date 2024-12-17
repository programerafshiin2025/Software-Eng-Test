import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/data/globalvariable.dart';
import 'package:shopping_app/pages/mainpage.dart';
import 'package:shopping_app/pages/products_details_page.dart';
import 'package:shopping_app/provider/shoesProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          
          create: (context) => shoesprovider(),)

      ],
      child: MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(fontSize: 20, color: Colors.black)),
              textTheme: const TextTheme(
                  titleLarge:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  titleMedium: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  bodySmall: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
              useMaterial3: true),
          home: ShoesApp()),
    );
  }
}
