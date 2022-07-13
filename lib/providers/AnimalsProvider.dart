import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Animals.dart';
import '../resources/UrlResources.dart';
import '../views/other/ConnectionProblem.dart';
import '../views/other/NoInternet.dart';

class AnimalsProvider with ChangeNotifier
{
  List<Animals> alldata;

  getAllAnimals(context) async {
    try {
      await ApiHandler.get(UrlResources.VIEW_ANIMALS).then((json) {
        print(json.toString());
        alldata = json
            .map<Animals>((obj) => Animals.fromJson(obj))
            .toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {
      print(ex.message);
      if (ex.message == "Internet Connection Failure") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoInternet()));
      } else if (ex.message == "Connection Problem") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConnectionProblem()));
      }
    }
  }
}