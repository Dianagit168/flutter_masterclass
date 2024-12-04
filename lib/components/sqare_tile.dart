import 'package:flutter/material.dart';

class SqareTile extends StatelessWidget {
  final String imagePath;
  const SqareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white)),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
