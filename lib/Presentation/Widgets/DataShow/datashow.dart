import 'package:flutter/material.dart';
import 'package:task_managment/Presentation/Widgets/DataShow/data_show_model.dart';

class Datashow extends StatefulWidget {
  const Datashow({super.key});

  @override
  State<Datashow> createState() => _DatashowState();
}

class _DatashowState extends State<Datashow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataShows.isEmpty
          ? Center(child: Text('empty datamodels'))
          : ListView.builder(
              itemCount: dataShows.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(dataShows[index].email.toString()),
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
