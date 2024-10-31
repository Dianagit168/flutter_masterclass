import 'package:flutter/material.dart';
import 'package:flutter_maserclass/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDo = [
    ["Make Tutorial", false],
    ['Do Exercise', false],
  ];
  void checkBoxChanged(int index, bool value) {
    setState(() {
      String a = toDo[index][0];
      toDo[index][1] = value;
      print(a.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: toDo.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: toDo[index][0],
            taskComplete: toDo[index][1],
            onChanged: (value) => checkBoxChanged(index, value!),
          );
        },
      ),
    );
  }
}
