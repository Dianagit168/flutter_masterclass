import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final void Function()? onTap;

  const MyListTile(
      {super.key, required this.iconData, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.grey,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
