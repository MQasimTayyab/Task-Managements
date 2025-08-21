import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:task_managment/Presentation/Widgets/AddTask/add_task_controller.dart';

import 'package:task_managment/Domain/model/task_model.dart';
import 'package:task_managment/Presentation/Widgets/Product/productshow.dart';
import 'package:task_managment/Provider/provider_tast.dart';

class AddTaskScreen extends StatefulWidget {
  final Task? task;

  const AddTaskScreen({super.key, this.task});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  AddTaskController controller = AddTaskController();
  final TextEditingController _taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      _taskController.text = widget.task!.description;
      controller.selectedDate = widget.task!.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
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
            SizedBox(height: 20),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => ShowTaskScreen()));
            //     },
            //     child: Text('usermodel')),
            // SizedBox(height: 10),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Datashow()));
            //     },
            //     child: Text('showdata')),
            // SizedBox(height: 10),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Productshow()));
            //     },
            //     child: Text('product')),
            // SizedBox(height: 10),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => Productshow()));
            //     },
            //     child: Text('product'))
          ],
        ),
      ),
    );
  }
}
