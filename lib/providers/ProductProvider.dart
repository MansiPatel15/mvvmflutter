import 'package:flutter/material.dart';

import '../helpers/ApiHandler.dart';
import '../helpers/error_handler.dart';
import '../models/Products.dart';
import '../resources/UrlResources.dart';
import '../views/other/ConnectionProblem.dart';
import '../views/other/NoInternet.dart';

class ProductProvider with ChangeNotifier {
  List<Products> alldata;

  getAllProducts(context) async {
    try {
      await ApiHandler.get(UrlResources.VIEW_PRODUCT).then((json) {
        alldata = json["data"]
            .map<Products>((obj) => Products.fromJson(obj))
            .toList();
        notifyListeners();
      });
    } on ErrorHandler catch (ex) {
      if (ex.message == "Internet Connection Failure") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoInternet()));
      } else if (ex.message == "Connection Problem") {}
    }
  }

  bool isinserted = false;
  addProduct(context, params) async {
    try {
      await ApiHandler.post(UrlResources.ADD_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true")
        {
          isinserted = true;
        }
        else
        {
          isinserted = false;
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

  bool isdeleted = false;
  deleteProduct(context,params)async {
    try {
      await ApiHandler.post(UrlResources.DELETE_PRODUCT, body: params)
          .then((json) {
        if (json["status"] == "true")
        {
          isdeleted = true;
        }
        else
        {
          isdeleted = false;
        }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message == "Internet Connection Failure") {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => NoInternet()));
      } else if (ex.message == "Connection Problem") {}
    }
  }
}


bool isupdated = false;
updateProduct(context,params) async {
  try {
    await ApiHandler.post(UrlResources.UPDATE_PRODUCT, body: params)
        .then((json) {
      if (json["status"] == "true")
      {
        isupdated = true;
      }
      else
      {
        isupdated = false;
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

