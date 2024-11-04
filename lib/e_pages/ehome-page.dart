import 'package:flutter/material.dart';
import 'package:flutter_maserclass/e_components/my_bottom_nav_bar.dart';

class EHomePage extends StatelessWidget {
  const EHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
