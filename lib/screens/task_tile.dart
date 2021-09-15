import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TaskTile extends StatelessWidget {
  final bool isChecked;
  final void Function(bool?)? toggleCheckboxState;
  final void Function()? onLongPress;
  final String title;
  
  // ignore: use_key_in_widget_constructors
  const TaskTile({
    required this.title,
    required this.isChecked,
    this.toggleCheckboxState,
    this.onLongPress
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: ListTile(
        onLongPress: onLongPress,
        title: Text( 
          title,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: toggleCheckboxState,
        ),
      ),
    );
  }
}