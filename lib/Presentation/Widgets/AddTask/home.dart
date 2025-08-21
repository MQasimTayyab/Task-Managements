import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_managment/Presentation/Widgets/AddTask/add_task.dart';
import 'package:task_managment/Provider/provider_tast.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Task Manager"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: provider.txtController,
                    decoration: InputDecoration(
                      hintText: 'Search tasks...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () => provider.pickedDate(context),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: provider.filteredTasks.isEmpty
                ? Center(child: Text("No tasks found"))
                : ListView.builder(
                    itemCount: provider.filteredTasks.length,
                    itemBuilder: (context, index) {
                      final task = provider.filteredTasks[index];
                      return Card(
                        margin:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: ListTile(
                          title: Text(task.description),
                          subtitle: Text(
                            'Date: ${task.date.toLocal().toString().split(' ')[0]}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () =>
                                    provider.editTask(task, context),
                                // Consumer<TaskProvider>(
                                //   builder: (context, Provider, child) {
                                //     return provider.editTask(
                                //         task, context);
                                //   },
                                // )
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () => provider.deleteTask(task.key),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
          if (result == true) {
            provider.loadTasks();
          }
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:hive_flutter/adapters.dart';
// import 'package:task_managment/Domain/model/task_model.dart';
// import 'package:task_managment/Presentation/Widgets/AddTask/add_task.dart';
// import 'package:task_managment/Presentation/Widgets/AddTask/add_task_controller.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// DateTime? datee;
// bool type = false;

// class _HomeScreenState extends State<HomeScreen> {
//   AddTaskController controller = AddTaskController();
//   TextEditingController txtController = TextEditingController();
//   String search = '';

//   @override
//   void initState() {
//     super.initState();

//     txtController.addListener(() {
//       print('1111111');
//       setState(() {
//         type = true;
//         search = txtController.text.toLowerCase();
//       });
//     });
//   }

//   @override
//   void dispose() {
//     txtController.dispose();
//     super.dispose();
//   }

//   void pickedDate() async {
//     DateTime? pick = await showDatePicker(
//         context: context,
//         initialDate: datee ?? DateTime.now(),
//         firstDate: DateTime(2000),
//         lastDate: DateTime(2100));

//     if (pick != null) {
//       setState(() {
//         type = false;
//         datee = pick;
//         print(datee.toString().split(' ')[0]);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('build');

//     return Scaffold(
//       backgroundColor: Colors.grey.shade300,
//       appBar: AppBar(
//         title: Text("Task Manager"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: txtController,
//                     decoration: InputDecoration(
//                       hintText: 'Search tasks...',
//                       prefixIcon: Icon(Icons.search),
//                       suffixIcon: IconButton(
//                         icon: const Icon(Icons.date_range),
//                         onPressed: pickedDate,
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 5,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ValueListenableBuilder<Box<Task>>(
//               valueListenable: Hive.box<Task>('tasks').listenable(),
//               builder: (context, tasks, _) {
//                 if (tasks.isEmpty) {
//                   return Center(child: Text('No tasks available.'));
//                 }

//                 List<Task> allTasks = tasks.values.toList();
//                 //
//                 List<Task> filteredTasks = allTasks.where((task) {
//                   final filter = type
//                       ? task.description.toLowerCase().startsWith(search)
//                       : task.date.toLocal().toString().split(' ')[0] ==
//                           datee.toString().split(' ')[0];

//                   return filter;
//                 }).toList();
//                 if (filteredTasks.isEmpty) {
//                   return Center(child: Text('No data found.'));
//                 }

//                 // List<Task> filteredTasks = allTasks.where((task) {

//                 //   return task.description.toLowerCase().startsWith(search);
//                 // }).toList();

//                 return ListView.builder(
//                   itemCount: filteredTasks.length,
//                   itemBuilder: (context, index) {
//                     final task = filteredTasks[index];
//                     return Card(
//                       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       child: ListTile(
//                         title: Text(task.description),
//                         subtitle: Text(
//                           'Date: ${task.date.toLocal().toString().split(' ')[0]}',
//                         ),
//                         trailing: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             IconButton(
//                               icon: Icon(Icons.edit),
//                               onPressed: () =>
//                                   controller.editTask(task, context),
//                             ),
//                             IconButton(
//                               icon: Icon(Icons.delete, color: Colors.red),
//                               onPressed: () => controller.deleteTask(task.key),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           final result = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const AddTaskScreen()),
//           );
//           if (result == true) {}
//         },
//       ),
//     );
//   }
// }
