import 'package:flutter/material.dart';
import 'package:task_managment/Presentation/Widgets/UserProf/userprof.dart';

class ShowUserprof extends StatefulWidget {
  const ShowUserprof({super.key});

  @override
  State<ShowUserprof> createState() => _ShowUserprofState();
}

class _ShowUserprofState extends State<ShowUserprof> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userProfiles.isEmpty
          ? Center(child: Text('empty usermodels data'))
          : ListView.builder(
              itemCount: userProfiles.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title:
                        Text(userProfiles[index].userProfile!.email.toString()),
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
