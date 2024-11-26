import 'package:flutter/material.dart';
import 'package:flutter_maserclass/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).colorScheme.surface,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 75,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Minimal Shop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Primium Quality Products',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            MyButton(
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
