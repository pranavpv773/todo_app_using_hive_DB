// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_flutter_application/db/modal/data_modal.dart';

ValueNotifier<List<Task>> tasklistNotifier = ValueNotifier([]);

void addTask(Task value) async {
  final taskDb = await Hive.openBox<Task>('task_db');
  final _id = await taskDb.add(value);
  value.id = _id;
  await taskDb.put(value.id, value);
  tasklistNotifier.value.add(value);
  tasklistNotifier.notifyListeners();
}

getallTasks() async {
  final taskDb = await Hive.openBox<Task>('task_db');
  tasklistNotifier.value.clear();
  tasklistNotifier.value.addAll(taskDb.values);
  tasklistNotifier.notifyListeners();
}

deleteTask(int id) async {
  final taskDb = await Hive.openBox<Task>('task_db');
  await taskDb.delete(id);
  getallTasks();
}
