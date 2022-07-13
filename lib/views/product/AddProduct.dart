import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:mvvm/views/product/ViewProducts.dart';
import 'package:mvvm/widgets/MyPrimaryButton.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  ProductProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddProduct..."),
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
                var nm = _name.text.toString();
                var qt = _qty.text.toString();
                var pri = _price.text.toString();


                if(nm=="")
                {
                  Fluttertoast.showToast(
                      msg: "Please Enter Name",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else if(qt=="")
                {
                  Fluttertoast.showToast(
                      msg: "Please Enter qty",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else if(pri=="")
                {
                  Fluttertoast.showToast(
                      msg: "Please Enter price",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else
                {
                  Map<String, String> params = {
                    "pname": nm,
                    "qty": qt,
                    "price": pri
                  };

                  await provider.addProduct(context, params);
                  if(provider.isinserted)
                  {
                    //print("Record Inserted");
                    Fluttertoast.showToast(
                        msg: "Employee Inserted Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                    //await provider.getAllEmployee(context);
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ViewProducts())
                    );
                  }
                  else
                  {
                    Fluttertoast.showToast(
                        msg: "Employee Not Inserted Successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }
                }
                //200 ok
                //400 not found
                //500 server
                // _name.text="";
                // _qty.text="";
                // _price.text="";
                //API
                // Uri url = Uri.parse("http://picsyapps.com/studentapi/insertProductNormal.php");
                // var response = await http.post(url,body: {
                //   "pname":nm,
                //   "qty":qt,
                //   "price":pri
                // });
                // if(response.statusCode==200)
                // {
                //   var body = response.body.toString();
                //   var json = jsonDecode(body);
                // }
                // else
                // {
                //   print("API Error");
                // }
                //API
              },
              buttontext: "Submit",
              //child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)) ,
            ),
          ]),
        )),
      ),
    );
  }
}
