import 'dart:convert';

import 'package:api_and_hive/main.dart';
import 'package:api_and_hive/model/data.dart';
import 'package:api_and_hive/model/localdata.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Change extends ChangeNotifier {
  Set<String>? selected;
  String? country;
  String? field;
  List msglist = [];
  List<Localdata> locallist = [
    Localdata(field: 'health', image: 'image'),
    Localdata(field: 'business', image: 'image'),
    Localdata(field: 'science', image: 'image'),
    Localdata(field: 'sport', image: 'image'),
    Localdata(field: 'entertainment', image: 'image'),
    Localdata(field: 'technology', image: 'image'),
  ];
  Box? msg;
  List<Data> datalist = [];
  openbox() async {
    msg = await Hive.openBox('message');
    getdata();
  }

  changeselected(Set<String> value) {
    selected = value;
    notifyListeners();
  }

  getcountry({String? count}) {
    country = count;

    notifyListeners();
  }

  getfield({String? fiel}) {
    field = fiel;
    notifyListeners();
  }

  putdata(String message) async {
    if (message != '' || !message.isEmpty) {
      await msg!.put('msg_${DateTime.now().microsecondsSinceEpoch}', message);
    }

    getdata();
    notifyListeners();
  }

  getdata() async {
    msglist = msg!.values.cast<String>().toList(); //get all the messages
    notifyListeners();
  }

  deletedata(int index) async {
    try {
      var key = msg!.keyAt(index);
      msg!.delete(key);
    } catch (e) {}

      getdata();
    notifyListeners();
  }

  fetchdata({
    country,
    field,
  }) async {
    try {
      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=$country&category=$field&apiKey=1b18c3db3142420d858568ab22b38ee1'));
      if (response != null && response != "") {
        var jsonbody = await jsonDecode(response.body)['articles'] as List;
        datalist = jsonbody.map((json) => Data.fromjson(json)).toList();
      }
    } catch (e) {}

    notifyListeners();
  }
}


// import 'dart:convert';
// import 'package:api_and_hive/model/data.dart';
// import 'package:api_and_hive/model/localdata.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:http/http.dart' as http;

// class Change extends ChangeNotifier {
//   Set<String>? selected;
//   String? country;
//   String? field;
//   List<String> msglist = [];
//   List<Localdata> locallist = [
//     Localdata(field: 'health', image: 'image'),
//     Localdata(field: 'business', image: 'image'),
//     Localdata(field: 'science', image: 'image'),
//     Localdata(field: 'sport', image: 'image'),
//     Localdata(field: 'entertainment', image: 'image'),
//     Localdata(field: 'technology', image: 'image'),
//   ];
//   List<Data> datalist = [];
//   Box? msg;

//   Change() {
//     openBox();
//   }

//   Future<void> openBox() async {
//     msg = await Hive.openBox('messages');
//     getdata();
//   }

//   changeselected(Set<String> value) {
//     selected = value;
//     notifyListeners();
//   }

//   getcountry({String? count}) {
//     country = count;
//     notifyListeners();
//   }

//   getfield({String? fiel}) {
//     field = fiel;
//     notifyListeners();
//   }

//   putdata(String message) async {
//     if (message.isNotEmpty) {
//       await msg!.put('msg_${DateTime.now().millisecondsSinceEpoch}', message);
//       getdata();
//     }
//   }

//   getdata() {
//     msglist = msg!.values.cast<String>().toList();
//     notifyListeners();
//   }

//   deletedata(int index) async {
//     var key = msg!.keyAt(index);
//     await msg!.delete(key);
//     getdata();
//   }

//   fetchdata({String? country, String? field}) async {
//     try {
//       var response = await http.get(Uri.parse(
//           'https://newsapi.org/v2/top-headlines?country=$country&category=$field&apiKey=1b18c3db3142420d858568ab22b38ee1'));
//       if (response.statusCode == 200) {
//         var jsonbody = jsonDecode(response.body)['articles'] as List;
//         datalist = jsonbody.map((json) => Data.fromjson(json)).toList();
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//     notifyListeners();
//   }
// }
