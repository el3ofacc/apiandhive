// ignore_for_file: prefer_const_constructors

import 'package:api_and_hive/view/apiscreen.dart';
import 'package:api_and_hive/view/tasks.dart';
import 'package:api_and_hive/viewmodel/change.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  //var data = Localdata();
  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(
      builder: (context, provider, child) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
       
            appBar: AppBar(
              backgroundColor: Colors.cyan,
              actions: [
                DropdownButton<String>(
                  dropdownColor: Colors.blue,
                  hint: Text(
                    'content',
                    style: TextStyle(color: Colors.white),
                  ),
                  items: [ 
                    DropdownMenuItem(
                      child: Text(
                        "egypt",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: 'eg',
                    ),
                    DropdownMenuItem(
                      child: Text('united states',
                          style: TextStyle(color: Colors.white)),
                      value: 'us',
                    ),
                    DropdownMenuItem(child: Text('brazil', 
                     style: TextStyle(color: Colors.white)),
                    value: 'br',),
                    DropdownMenuItem(child: Text('turkey',
                      style: TextStyle(color: Colors.white)),
                    value: 'tr',),
                    DropdownMenuItem(child: Text('ask',
                      style: TextStyle(color: Colors.white)),
                    value: 'sa',)
                  ],
                  onChanged: (value) {
                    provider.getcountry(count: value.toString());
                     
                    provider.fetchdata(
                        country: provider.country, field: provider.field);
                  
                    
                  },
                )
              ],
              bottom: TabBar(tabs: const [
                Tab(
                  child: Icon(
                    Icons.api,
                    size: 60,
                  ),
                ),
                Tab(
                  child: Icon(
                    Icons.message,
                    size: 60,
                  ),
                )
              ]),
            ),
            body: TabBarView(children:   [Apiscreen(), Tasks()]),
          ),
        );
      },
    );
  }
}
