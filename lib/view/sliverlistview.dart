import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class Sliverlistview extends StatelessWidget {
  Sliverlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Change>(builder: (context, provider, child) {
      return SizedBox(
        height: 100,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.locallist.length,
            itemBuilder: (context, index) {
              var element = provider.locallist[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    provider.getfield(fiel: element.field.toString());
                    provider.fetchdata(
                        field: provider.field,//element.field.toString(),
                        country: provider.country.toString());
       
                    
                  },
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 200,
                    child: Center(child: Text(element.field.toString())),
                  ),
                ),
              );
            }),
      );
    });
  }
}
