import 'package:flutter/material.dart';
import 'package:flutter_maserclass/database/habit_database.dart';
import 'package:flutter_maserclass/pages/cart_page.dart';
import 'package:flutter_maserclass/pages/intropage.dart';
import 'package:flutter_maserclass/pages/home_page.dart';

import 'package:flutter_maserclass/theme/theme_provider.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// // Initialize database
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  // await Hive.initFlutter();
  // // var box = await Hive.openBox('mybox');

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => HabitDatabase(),
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
      theme: Provider.of<ThemeProvider>(context).themeData,
      // home: const IntroPage(),
      initialRoute: '/intro_page',
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const HomePage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
