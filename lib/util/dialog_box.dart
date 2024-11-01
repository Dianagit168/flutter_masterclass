import 'package:flutter/material.dart';
import 'package:flutter_maserclass/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback cancelPessed;
  final VoidCallback savePressed;

  const DialogBox(
      {super.key,
      required this.controller,
      required this.cancelPessed,
      required this.savePressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        color: Colors.yellow,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a new task',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Cancel",
                  onPress: cancelPessed,
                ),
                const SizedBox(
                  width: 10,
                ),
                MyButton(
                  text: "Save",
                  onPress: savePressed,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
