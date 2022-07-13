import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Employee.dart';
import '../resources/UrlResources.dart';
import '../views/other/ConnectionProblem.dart';
import '../views/other/NoInternet.dart';

class EmployeeProvider with ChangeNotifier {
  List<Employee> alldata;

  getAllEmployee(context) async {
    try {
      await ApiHandler.get(UrlResources.VIEW_EMPLOYEE).then((json) {
        alldata = json["data"]
            .map<Employee>((obj) => Employee.fromJson(obj))
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

  bool isinserted=false;
  addEmployee(context,params) async
  {
    try {
      await ApiHandler.post(UrlResources.ADD_EMPLOYEE,body: params).then((json){
        if(json["status"]=="true")
        {
            isinserted=true;
        }
        else
          {
            isinserted  = false;
          }
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

  bool isdeleted =false;
  deleteEmployee(context,params)async
  {
    try {
      await ApiHandler.post(UrlResources.DELETE_EMPLOYEE,body: params).then((json){
        if(json["status"]=="true")
        {
          isdeleted=true;
        }
        else
        {
          isdeleted  = false;
        }
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
