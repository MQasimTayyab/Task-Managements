import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_managment/Domain/model/task_model.dart';
import 'package:task_managment/Presentation/Widgets/AddTask/add_task_controller.dart';

class TaskProvider with ChangeNotifier {
  final AddTaskController controller = AddTaskController();
  final TextEditingController txtController = TextEditingController();

  DateTime? datee;
  bool type = false;
  String search = '';

  List<Task> _allTasks = [];
  List<Task> _filteredTasks = [];

  List<Task> get filteredTasks => _filteredTasks;

  TaskProvider() {
    loadTasks();

    /// listenersearch text
    txtController.addListener(() {
      type = true;
      search = txtController.text.toLowerCase();
      filterTasks();
    });
  }

  void loadTasks() {
    final tasks = Hive.box<Task>('tasks').values.toList();
    _allTasks = tasks;
    filterTasks();
  }

  void filterTasks() {
    if (_allTasks.isEmpty) {
      _filteredTasks = [];
    } else {
      _filteredTasks = _allTasks.where((task) {
        if (type) {
          return task.description.toLowerCase().startsWith(search);
        } else if (datee != null) {
          return task.date.toLocal().toString().split(' ')[0] ==
              datee.toString().split(' ')[0];
        }
        return true;
      }).toList();
    }
    notifyListeners();
  }

  Future<void> pickedDate(BuildContext context) async {
    DateTime? pick = await showDatePicker(
        context: context,
        initialDate: datee ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pick != null) {
      type = false;
      datee = pick;
      filterTasks();
    }
  }

  void deleteTask(dynamic key) {
    controller.deleteTask(key);
    loadTasks();
  }

  void editTask(Task task, BuildContext context) {
    controller.editTask(task, context).then((_) => loadTasks());
  }
}
