// ignore_for_file: prefer_const_constructors

import 'package:api_and_hive/view/homepage.dart';
import 'package:api_and_hive/viewmodel/change.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

 //late CollectionBox msg;
 //BoxCollection? collection;
//Future<BoxCollection> opencollection(Set<String> box) async {
//  return await BoxCollection.open('tasks', box,
  //    path: (await getApplicationDocumentsDirectory()).path);
//}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //collection = await opencollection({'msg'});
//  msg = await collection!.openBox('msg');
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Change(),
        child: MaterialApp(
          home: Homepage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
