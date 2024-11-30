import 'package:flutter/material.dart';
import 'package:flutter_maserclass/components/my_drawer.dart';
import 'package:flutter_maserclass/components/my_habit_tile.dart';
import 'package:flutter_maserclass/components/my_heatmap.dart';
import 'package:flutter_maserclass/database/habit_database.dart';
import 'package:flutter_maserclass/model/habit.dart';
import 'package:flutter_maserclass/util/habit_util.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  void createNewHabit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Create a new habit'),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // get a new habit name
              String newHabitName = controller.text;
              // save to db
              context.read<HabitDatabase>().addHabit(newHabitName);
              // pop box
              Navigator.pop(context);
              //clear controller
              controller.clear();
            },
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              controller.clear();
            },
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }

  void checkHabitOnOff(bool? value, Habit habit) {
    if (value != null) {
      context.read<HabitDatabase>().updateHabitCompletion(habit.id, value);
    }
  }

  @override
  void initState() {
    context.read<HabitDatabase>().readHabits();
    super.initState();
  }

  //edit habit

  void editHabitBox(Habit habit) {
    controller.text = habit.name; // show base name on textfield
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Edit habit'),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              // get a new habit name
              String newHabitName = controller.text;
              // save to db
              context
                  .read<HabitDatabase>()
                  .updateHabitName(habit.id, newHabitName);
              // pop box
              Navigator.pop(context);
              //clear controller
              controller.clear();
            },
            child: Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              controller.clear();
            },
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }

  //delete habit
  void deleteHabitBox(Habit habit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Are you sure you want to delete?'),
        actions: [
          MaterialButton(
            onPressed: () {
              context.read<HabitDatabase>().deleteHabit(habit.id);
              // pop box
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //final productData = context.watch<ProduProvider>().shop;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Page'),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewHabit,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
      ),
      body: ListView(
        children: [
          buildHeadmap(),
          buildHabitList(context),
        ],
      ),
    );
  }

  Widget buildHabitList(BuildContext context) {
    final habitDatabase = context.watch<HabitDatabase>();

    List<Habit> currentHabit = habitDatabase.currentHabits;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: currentHabit.length,
      itemBuilder: (context, index) {
        bool isCompletedToday =
            isHabitCompletedToday(currentHabit[index].completedDays);
        // print(isCompletedToday);
        // print(currentHabit[index].completedDays);
        return MyHabitTile(
          name: currentHabit[index].name,
          isCompletedDays: isCompletedToday,
          onChanged: (value) => checkHabitOnOff(value, currentHabit[index]),
          editHabit: () => editHabitBox(currentHabit[index]),
          deleteHabit: () => deleteHabitBox(currentHabit[index]),
        );
      },
    );
  }

  Widget buildHeadmap() {
    final databaseHabit = context.watch<HabitDatabase>();
    List<Habit> currentHabit = databaseHabit.currentHabits;

    // heatmap UI
    return FutureBuilder<DateTime?>(
      future: databaseHabit.getFirstLaunchDate(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyHeatmap(
            startDate: snapshot.data!,
            datasets: prepHeatmapDataset(currentHabit),
          );
        } else
          return Container();
      },
    );
  }
}
