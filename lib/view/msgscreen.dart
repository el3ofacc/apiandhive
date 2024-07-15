import 'package:api_and_hive/main.dart';
import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Msgscreen extends StatelessWidget {
  Msgscreen({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(
      builder: (context, provider, child) {
        return Scaffold(
          body: ListView.builder(
              itemCount: provider.msglist.length,
              itemBuilder: (context, index) {
                var element = provider.msglist[index];
                return InkWell(
                  onLongPress: () {
                    provider.deletedata(index);
                  },
                  child: element == null
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 400),
                            child: Text("thier is no data"),
                          ),
                        )
                      : Card(
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              element.toString(),
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                );
              }),
        );
      },
    );
  }
}
