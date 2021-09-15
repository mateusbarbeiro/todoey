import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/task_tile.dart';

// ignore: use_key_in_widget_constructors
class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksData>(
      builder: (context, taskData, child) { 
        return  ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              title: task.name,
              isChecked: task.isDone,
              toggleCheckboxState: (checkboxState) {
                taskData.updateTask(task);
              },
              onLongPress: () => taskData.deleteTask(task),
            );
          },
          itemCount: taskData.taskCount,
        );
      }
    );
  }
}
