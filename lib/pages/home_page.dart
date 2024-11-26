import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_maserclass/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //final productData = context.watch<ProduProvider>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: Center(
          child: CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(),
          ),
        ),
      ),
      // body: Column(
      //   children: [
      //     Center(
      //       child: Text(
      //         'Pick from a selected list of premium products',
      //         style: TextStyle(
      //             color: Theme.of(context).colorScheme.inversePrimary),
      //       ),
      //     ),
      //     const SizedBox(height: 25),
      //     SizedBox(
      //       height: 550,
      //       child: ListView.builder(
      //         padding: const EdgeInsets.all(15),
      //         scrollDirection: Axis.horizontal,
      //         itemCount: productData.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return ProductTile(
      //             productModel: productData[index],
      //           );
      //         },
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
