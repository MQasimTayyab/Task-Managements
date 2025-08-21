import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:task_managment/Domain/model/task_model.dart';
import 'package:task_managment/Presentation/Widgets/AddTask/home.dart';
import 'package:task_managment/Provider/provider_tast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('tasks');

  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}


// import 'package:flutter/material.dart';

// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';

// import 'package:task_managment/Domain/model/task_model.dart';
// import 'package:task_managment/Presentation/Widgets/AddTask/home.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   var directory = await getApplicationDocumentsDirectory();
//   Hive.registerAdapter(TaskAdapter());

//   Hive.init(directory.path);

//   await Hive.openBox<Task>('tasks');
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
      // debugShowCheckedModeBanner: false,
//       home: HomeScreen(),
//     );
//   }
// }
