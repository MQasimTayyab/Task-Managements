import 'package:flutter/material.dart';

import 'package:task_managment/Presentation/Widgets/AddTask/add_task_controller.dart';

import 'package:task_managment/Presentation/Widgets/DataShow/datashow.dart';

import 'package:task_managment/Domain/model/task_model.dart';

import 'package:task_managment/Presentation/Widgets/Product/productshow.dart';

import 'package:task_managment/Presentation/Widgets/ShowTask/show_userprof.dart';
import 'package:task_managment/Presentation/Widgets/ShowTask/showtask.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;
  final int? index;

  const AddTaskScreen({super.key, this.task, this.index});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  AddTaskController controller = AddTaskController();
  final TextEditingController _taskController = TextEditingController();
  DateTime? selectedDate;
  // final ValueNotifier<List<Task>> taskNotifier = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _taskController.text = widget.task!.description;
      selectedDate = widget.task!.date;
    }
  }

  // Future<void> _submitTask() async {
  //   if (_taskController.text.isEmpty || selectedDate == null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please enter task and select a date')),
  //     );
  //     return;
  //   }

  //   final box = Hive.box<Task>('tasks');
  //   final newTask = Task(
  //     description: _taskController.text,
  //     date: selectedDate!,
  //   );

  //   if (widget.task == null) {
  //     // Add new task
  //     await box.add(newTask);
  //   } else {
  //     // Edit task
  //     await box.putAt(widget.index!, newTask);
  //   }

  //   taskNotifier.value = box.values.toList(); // Update notifier
  //   Navigator.pop(context, true);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(widget.task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Task Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(controller.selectedDate == null
                    ? 'Select Date'
                    : controller.selectedDate!
                        .toLocal()
                        .toString()
                        .split(' ')[0]),
                Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: controller.selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        controller.selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Text('Pick Date'),
                )
              ],
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                controller.submitTask(context, widget, _taskController);
              },
              child: Text(widget.task == null ? 'Save Task' : 'Update Task'),
            ),

            //  ElevatedButton(
            //  onPressed: _submitTask,
            //   child: Text('Save Task'),
            // ),
            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowTaskScreen()));
                },
                child: Text('usermodel')),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  // List<DataShowModel> data = dataShows;
                  // print(data);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Datashow()));
                },
                child: Text('showdata')),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Productshow()));
                  // List<Product> prod = productShows;
                  // print(prod);
                  // log('error');
                },
                child: Text('product')),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShowUserprof()));
                  //   List<UserprofModel> user = userProfiles;
                  //   print(user);
                },
                child: Text('product'))
          ],
        ),
      ),
    );
  }
}
