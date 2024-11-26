import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maserclass/components/my_list.dart';
import 'package:flutter_maserclass/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.shopping_bag,
              size: 75,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          MyListTile(
            iconData: Icons.home,
            text: 'Shop',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyListTile(
            iconData: Icons.shopping_cart,
            text: 'Cart',
            onTap: () {
              Navigator.pushNamed(context, '/cart_page');
            },
          ),
          const Spacer(),
          MyListTile(
            iconData: Icons.logout,
            text: 'Exit',
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false);
            },
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
