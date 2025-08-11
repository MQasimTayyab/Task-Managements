// import 'dart:convert';
// import 'dart:developer';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task_managment/add_task_controller.dart';

// class Sharedpref {
//   static String storageKey = 'task';

//   static Future<List<Task>> loadTasks() async {
//     final prefs = await SharedPreferences.getInstance();
//     final List<String>? list = prefs.getStringList(storageKey);
//     if (list == null) return [];
//     return list.map((e) => Task.fromJson(json.decode(e))).toList();
//   }

//   static Future<void> saveTasks(List<Task> tasks) async {
//     print(saveTasks.runtimeType);
//     final prefs = await SharedPreferences.getInstance();
//     final list = tasks.map((task) => json.encode(task.toJson())).toList();
//     await prefs.setStringList(storageKey, list);
//   }

//   static Future<void> addTask(Task task) async {
//     List<Task> tasks = await loadTasks();
//     log('return');
//     print(addTask.runtimeType);
//     tasks.add(task);
//     print(tasks.add.runtimeType);
//     await saveTasks(tasks);
//   }
// }

