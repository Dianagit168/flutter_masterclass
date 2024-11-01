import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPress;
  const MyButton({super.key, this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress,
      color: Theme.of(context).primaryColor,
      child: Text(text!),
    );
  }
}
