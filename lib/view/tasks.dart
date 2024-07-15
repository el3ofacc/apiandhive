import 'package:api_and_hive/view/cardsheet.dart';
import 'package:api_and_hive/view/msgscreen.dart';
import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Change>(context, listen: false).openbox();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            size: 60,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Cardsheet();
                });
          },
        ),
        body: Msgscreen());
  }
}
