import 'package:flutter/material.dart';
import 'package:flutter_maserclass/home_page.dart';
import 'package:flutter_maserclass/profile_page.dart';
import 'package:flutter_maserclass/setting_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int selectedIndex = 0;
  List page = [
    const HomePage(),
    const ProfilePage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: page[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }
}
