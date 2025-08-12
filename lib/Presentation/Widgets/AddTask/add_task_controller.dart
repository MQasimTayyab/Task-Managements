import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_managment/Domain/model/task_model.dart';
import 'package:task_managment/Presentation/Widgets/AddTask/add_task.dart';

class AddTaskController {
  DateTime? selectedDate;
  final ValueNotifier<List<Task>> taskNotifier = ValueNotifier([]);

  Future<void> loadTasks() async {
    final box = Hive.box('tasks');
    taskNotifier.value = box.values.toList() as List<Task>;
  }

  Future<void> deleteTask(int index) async {
    final box = Hive.box<Task>('tasks');
    await box.delete(index);
    taskNotifier.value = box.values.toList();
  }

  Future<void> editTask(
    task,
    context,
  ) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddTaskScreen(
          task: task,
        ),
      ),
    );

    if (result == true) {
      loadTasks();
    }
  }

  Future<void> submitTask(context, widget, taskcontroller) async {
    if (taskcontroller.text.isEmpty || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter task and select a date')),
      );
      return;
    }

    final box = Hive.box<Task>('tasks');
    final newTask = Task(
      description: taskcontroller.text,
      date: selectedDate!,
    );

    if (widget.task == null) {
      // Add new task
      await box.add(newTask);
    } else {
      // Edit task
      await box.putAt(widget.task.key, newTask);
    }

    taskNotifier.value = box.values.toList(); // Update notifier
    Navigator.pop(context, true);
  }
}
