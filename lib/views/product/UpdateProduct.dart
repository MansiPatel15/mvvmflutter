import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm/views/product/ViewProducts.dart';
import 'package:provider/provider.dart';

import '../../providers/ProductProvider.dart';
import 'package:http/http.dart' as http;
import '../../resources/UrlResources.dart';
import '../../widgets/MyPrimaryButton.dart';

class UpdateProduct extends StatefulWidget {

  var updatepid="";
  UpdateProduct({this.updatepid});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  ProductProvider provider;

  getdata() async {
    Uri url = Uri.parse(UrlResources.GET_SINGLE_PRODUCT);
    var response = await http.post(url, body: {"pid": widget.updatepid});
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body.toString());
      if (json["status"] == "true") {
        setState(() {
          _name.text = json["data"]["pname"].toString();
          _qty.text = json["data"]["qty"].toString();
          _price.text = json["data"]["price"].toString();
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UpdateProduct..."),
      ),
      body: SingleChildScrollView(
        child: Form(
            child: Padding(
              padding: EdgeInsets.all(10),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "Name : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Qty : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _qty,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Price : ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _price,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 40,
                ),
                MyPrimaryButton(
                  onclick: () async {
                    var name = _name.text.toString();
                    var qty = _qty.text.toString();
                    var price = _price.text.toString();

                    Uri url = Uri.parse(UrlResources.UPDATE_PRODUCT);
                    var response = await http.post(url,body: {
                      "pname":name,
                      "qty":qty,
                      "price":price,
                      "pid":widget.updatepid
                    });
                    if (response.statusCode == 200) {

                      var body = response.body.toString();
                      var json = jsonDecode(body);

                      if(json["status"]=="true")
                      {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ViewProducts()));
                      }
                    }

                  },
                  buttontext: "Update",
                  //child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)) ,
                ),
              ]),
            ),
        ),
      ),
    );
  }
}