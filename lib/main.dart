import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'package:task_managment/Domain/model/task_model.dart';
import 'package:task_managment/Presentation/Widgets/AddTask/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(TaskAdapter());

  Hive.init(directory.path);

  await Hive.openBox<Task>('tasks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}




// class HomeScreen extends StatefulWidget {
//   HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Task> _tasks = [];
//   @override
//   void initState() {
//     super.initState();
//     _loadTasks();
//   }

//   Future<void> _loadTasks() async {
//     final tasks = await HiveTaskService.loadTasks();
//     setState(() {
//       _tasks = tasks;
//     });
//   }
//   // Future<void> _loadTasks() async {
//   //   final tasks = await Sharedpref.loadTasks();
//   //   setState(() {
//   //     _tasks = tasks;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: _tasks.isEmpty
//           ? Center(child: Text('No tasks available.'))
//           : ListView.builder(
//               itemCount: _tasks.length,
//               itemBuilder: (context, index) {
//                 final task = _tasks[index];
//                 return Card(
//                   margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: ListTile(
//                     title: Text(task.description),
//                     subtitle: Text(
//                       'Date: ${task.date.toLocal().toString().split(' ')[0]}',
//                     ),
              
//                   ),
              

//                 );
//               },
//             ),
            
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => AddTaskScreen()),
//           );
//         },
//       ),
//     );
//   }
// }
