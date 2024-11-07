import 'package:flutter/material.dart';
import 'package:flutter_maserclass/model/shop_provider.dart';
import 'package:flutter_maserclass/pages/cart_page.dart';
import 'package:flutter_maserclass/pages/intropage.dart';
import 'package:flutter_maserclass/pages/shop_page.dart';
import 'package:flutter_maserclass/theme/light_theme.dart';
import 'package:flutter_maserclass/theme/theme_provider.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  // var box = await Hive.openBox('mybox');

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProduProvider(),
      )
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      home: const IntroPage(),
      initialRoute: '/intro_page',
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
