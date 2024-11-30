import 'package:flutter/material.dart';

class MyHabitTile extends StatelessWidget {
  const MyHabitTile(
      {super.key,
      required this.name,
      required this.isCompletedDays,
      this.onChanged,
      this.editHabit,
      this.deleteHabit});
  final String name;
  final bool isCompletedDays;
  final void Function(bool?)? onChanged;
  final void Function()? editHabit;
  final void Function()? deleteHabit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!isCompletedDays);
        }
      },
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isCompletedDays
                ? Colors.green
                : Theme.of(context).colorScheme.secondary),
        child: ListTile(
          title: Row(
            children: [
              Text(
                name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isCompletedDays
                        ? Colors.white
                        : Theme.of(context).colorScheme.inversePrimary),
              ),
              IconButton(
                  onPressed: editHabit,
                  icon: Icon(Icons.edit),
                  color: isCompletedDays
                      ? Colors.white
                      : Theme.of(context).colorScheme.inversePrimary),
            ],
          ),
          leading: Checkbox(
              activeColor: Colors.green,
              value: isCompletedDays,
              onChanged: onChanged),
          trailing: IconButton(
            onPressed: deleteHabit,
            icon: Icon(Icons.delete),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
