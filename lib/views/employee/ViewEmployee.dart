import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/components/SingleEmployeeListItem.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/models/Employee.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:mvvm/components/SingleProductListItem.dart';
import 'package:mvvm/views/employee/ViewEmployeeSecond.dart';
import 'package:mvvm/views/other/ConnectionProblem.dart';
import 'package:mvvm/views/other/NoInternet.dart';
import 'package:provider/provider.dart';

import '../../helpers/error_handler.dart';
import '../../models/Products.dart';
import '../../providers/EmployeeProvider.dart';
import '../../providers/ProductProvider.dart';

class ViewEmployee extends StatefulWidget {
  @override
  State<ViewEmployee> createState() => _ViewEmployeeState();
}

class _ViewEmployeeState extends State<ViewEmployee> {
  EmployeeProvider provider;

  getdata() async {
    print("View MEthod Called");
    await provider.getAllEmployee(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context, listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewEmployee..."),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewEmployeeSecond()));
              },
              icon: Icon(Icons.star)),
        ],
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
              itemCount: provider.alldata.length,
              itemBuilder: (context, index) {
                return SingleEmployeeListItem(
                  onclick: () {},
                  deleteclick: () async{
                    Map<String,String> params = {
                      "eid":provider.alldata[index].eid.toString()
                    };
                    await provider.deleteEmployee(context, params);
                    if(provider.isdeleted)
                      {
                        await provider.getAllEmployee(context);
                        Fluttertoast.showToast(
                            msg: "Employee Deleted Successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                       // print("Deleted");
                      }
                    else
                      {
                        print("Not Deleted");
                      }
                  },
                  obj: provider.alldata[index],
                );
                // return GestureDetector(
                //   onTap: (){
                //     var eid = alldata[index].eid
                //         .toString();
                //
                //     // Navigator.of(context).push(
                //     //     MaterialPageRoute(builder: (context)=> ModelUpdateProduct())
                //     // );
                //   },
                //   child: Container(
                //     child: Card(
                //       color: Colors.blueGrey,
                //       child:  Column(
                //         mainAxisSize: MainAxisSize.max,
                //         children: [
                //           // Image.network(alldata[index].imageLink.toString(),),
                //           SizedBox(height: 20,),
                //           Text("Ename : "+alldata[index].ename.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                //           SizedBox(height: 20,),
                //           Text("Salary : "+alldata[index].salary.toString(),style: TextStyle(color: Colors.white)),
                //           SizedBox(height: 20,),
                //           Text("Gender : "+alldata[index].gender.toString(),style: TextStyle(color: Colors.white)),
                //           SizedBox(height: 20,),
                //         ],
                //       ),
                //     ),
                //   ),
                // );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
