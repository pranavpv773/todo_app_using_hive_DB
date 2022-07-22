// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:to_do_flutter_application/db/database_function.dart';
import 'package:to_do_flutter_application/db/modal/data_modal.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 50, 90),
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          "New Task",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('task Added Successfully....'),
                backgroundColor: Colors.blue[200],
              ),
            );
          }
          onAddTaskButtonClicked();
        },
        child: const Icon(
          Icons.check,
          color: Color.fromARGB(255, 8, 72, 128),
          size: 40,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: const Color.fromARGB(255, 19, 40, 85),
        child: ListView(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "What is to be done?",
                        style: TextStyle(
                          color: Colors.blue[200],
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: _nameController,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: 'Enter Task Here',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 123, 126, 129),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Due date",
                        style: TextStyle(
                          color: Colors.blue[200],
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter task';
                      }
                      return null;
                    },
                    controller: _typeController,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: 'Date Not Set',
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 123, 126, 129),
                      ),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> onAddTaskButtonClicked() async {
    final name = _nameController.text;
    final type = _typeController.text;

    if (name.isEmpty || type.isEmpty) {
      return;
    } else {
      final _task = Task(
        name: name,
        type: type,
      );

      addTask(_task);
    }
  }
}
