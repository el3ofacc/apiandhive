import 'package:api_and_hive/main.dart';
import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cardsheet extends StatelessWidget {
  Cardsheet({super.key});
  TextEditingController msgcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(
      builder: (context, provider, child) {
        return Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: TextFormField(
                  controller: msgcontroller,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      hintText: 'task',
                      labelText: 'task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    provider.putdata(msgcontroller.text);
                  
                    Navigator.of(context).pop();  //msgcontroller.clear();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    'add',
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        );
      },
    );
  }
}
