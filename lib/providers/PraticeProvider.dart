import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Pratice.dart';
import '../resources/UrlResources.dart';
import '../views/other/ConnectionProblem.dart';
import '../views/other/NoInternet.dart';

class PraticeProvider with ChangeNotifier
{
  List<Pratice> alldata;

  getAllPratice(context) async {
    try {
      await ApiHandler.get(UrlResources.VIEW_PRATICE).then((json) {
        print(json.toString());
        alldata = json["contacts"]
            .map<Pratice>((obj) => Pratice.fromJson(obj))
            .toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {
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