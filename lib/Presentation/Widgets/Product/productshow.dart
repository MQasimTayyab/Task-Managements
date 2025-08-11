// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_managment/Presentation/Widgets/Product/product.dart';

class Productshow extends StatefulWidget {
  const Productshow({super.key});

  @override
  State<Productshow> createState() => _ProductshowState();
}

class _ProductshowState extends State<Productshow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: productShows.isEmpty
          ? Center(child: Text('empty product shows data'))
          : ListView.builder(
              itemCount: productShows.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      Image.network(productShows[index].images!.first),
                      ListTile(
                        title: Text(productShows[index].description.toString()),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
