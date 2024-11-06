import 'package:flutter/material.dart';
import 'package:flutter_maserclass/components/my_box.dart';
import 'package:flutter_maserclass/components/my_button.dart';
import 'package:flutter_maserclass/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: MyBox(
            color: Theme.of(context).colorScheme.primary,
            child: MyButton(
              onTap: () {
                context.read<ThemeProvider>().toggleTheme();
              },
              color: Theme.of(context).colorScheme.secondary,
            )),
      ),
    );
  }
}
