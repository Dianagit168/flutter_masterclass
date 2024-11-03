import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List toDo = [];
  final mybox = Hive.box('mybox');

// run this method if this is the first time ever opening this app
  void createInitialData() {
    toDo = [
      ["Make Tutorial", false],
      ['Do Exercise', false],
    ];
  }

  // load the data from database
  void loadData() {
    toDo = mybox.get('TODOLIST');
  }

  //update database
  void updateData() {
    mybox.put('TODOLIST', toDo);
  }
}
