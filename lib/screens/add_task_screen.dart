import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class AddTaskScreen extends StatelessWidget {
  late String name;
  // void Function(String newTask) onPressed;

  // // ignore: use_key_in_widget_constructors
  // AddTaskScreen({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Adicionar Tarefa',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                }),
            const SizedBox(height: 30),
            TextButton(
              child: const Text(
                'Adicionar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Colors.lightBlueAccent,
                ),
                fixedSize: MaterialStateProperty.all(
                  const Size.fromHeight(50),
                ),
              ),
              onPressed: () {
                Provider.of<TasksData>(
                  context,
                  listen: false,
                ).addTask(name);

                Navigator.pop(context);
                // Navigator.pop(
                //   context,
                //   name,
                // );// outra maneira de fazer é passar valor por parametro do navigator
              },
            )
          ],
        ),
      ),
    );
  }
}
