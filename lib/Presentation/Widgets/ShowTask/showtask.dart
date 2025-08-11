import 'package:flutter/material.dart';

import 'package:task_managment/Presentation/Widgets/UserProf/usermodel.dart';

class ShowTaskScreen extends StatefulWidget {
  const ShowTaskScreen({super.key});

  @override
  State<ShowTaskScreen> createState() => _ShowTaskScreenState();
}

class _ShowTaskScreenState extends State<ShowTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userModels.isEmpty
          ? Center(child: Text('empty usermodels data'))
          : ListView.builder(
              itemCount: userModels.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(userModels[index].title.toString()),
                    subtitle: Text(
                      "",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
