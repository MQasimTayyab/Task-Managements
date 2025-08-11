// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// import 'package:task_managment/Domain/model/task_model.dart';



// class HiveTaskService {
//   final ValueNotifier<List<Task>> taskNotifier = ValueNotifier([]);
//   static const String boxName = 'tasks';

//   // Load tasks
//   static Future<List<Task>> loadTasks() async {
//     final box = await Hive.openBox<Task>(boxName);
//     return box.values.toList();
//   }

//   // Add single task
//   static Future<void> addTask(Task task) async {
//     Box box = await Hive.openBox<Task>(boxName);
//     await box.add(task);
//   }
// }
