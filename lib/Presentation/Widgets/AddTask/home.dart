import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task_managment/Domain/model/task_model.dart';
import 'package:task_managment/Presentation/Widgets/AddTask/add_task.dart';
import 'package:task_managment/Presentation/Widgets/AddTask/add_task_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // HiveTaskService hive =HiveTaskService();
  AddTaskController controller = AddTaskController();
  @override
  void initState() {
    super.initState();
    controller.loadTasks();
  }

  // final ValueNotifier<List<Task>> taskNotifier = ValueNotifier([]);
  // Future<void> _loadTasks() async {
  //   final box = Hive.box('tasks');
  //   taskNotifier.value = box.values.toList() as List<Task>;
  // }

  // Future<void> _deleteTask(int index) async {
  //   final box = Hive.box<Task>('tasks');
  //   await box.delete(index);
  //   taskNotifier.value = box.values.toList();
  // }

  // Future<void> _editTask(
  //   dynamic task,
  // ) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => AddTaskScreen(task: task),
  //     ),
  //   );

  //   if (result == true) {
  //     _loadTasks();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(title: Text("Task Manager")),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: Hive.box<Task>('tasks').listenable(),
        builder: (context, tasks, _) {
          if (tasks.isEmpty) {
            return Center(child: Text('No tasks available.'));
          }
          var data = tasks.values.toList();
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var taskData = tasks.values.toList()[index];
              final task = data[index];
              return Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(task.description),
                  subtitle: Text(
                      'Date: ${task.date.toLocal().toString().split(' ')[0]}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                        ),
                        onPressed: () => controller.editTask(taskData, context),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () => controller.deleteTask(taskData.key),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );
          if (result == true) {
            controller.loadTasks();
          }
        },
      ),
    );
  }
}
