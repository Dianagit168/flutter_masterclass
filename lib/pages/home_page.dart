import 'package:flutter/material.dart';
import 'package:flutter_maserclass/database.dart';
import 'package:flutter_maserclass/util/dialog_box.dart';
import 'package:flutter_maserclass/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TodoDataBase db = TodoDataBase();
  final mybox = Hive.box('mybox');
  final controller = TextEditingController();

  void checkBoxChanged(int index, bool value) {
    setState(() {
      String a = db.toDo[index][0];
      db.toDo[index][1] = value;
      print(a.toString());
    });
    db.updateData();
  }

  @override
  void initState() {
    //if this is the first time ever opening the app,then create default data.
    if (mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      //there alrady exist data
      db.loadData();
    }
    super.initState();
  }

  void onSave() {
    setState(() {
      db.toDo.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDo.removeAt(index);
    });
    db.updateData();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: controller,
          cancelPessed: () {
            setState(() {
              controller.clear();
            });
            Navigator.of(context).pop();
          },
          savePressed: onSave,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: db.toDo.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoTile(
            taskName: db.toDo[index][0],
            taskComplete: db.toDo[index][1],
            onChanged: (value) => checkBoxChanged(index, value!),
            onDelete: () => deleteTask(index),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: createNewTask,
        icon: const Icon(Icons.add),
      ),
    );
  }
}
