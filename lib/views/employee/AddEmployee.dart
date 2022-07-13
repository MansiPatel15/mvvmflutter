import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/providers/EmployeeProvider.dart';
import 'package:mvvm/views/employee/ViewEmployee.dart';
import 'package:mvvm/widgets/MyPrimaryButton.dart';
import 'package:provider/provider.dart';

import '../../resources/UrlResources.dart';

class AddEmployee extends StatefulWidget {

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController _ename = TextEditingController();
  TextEditingController _salary = TextEditingController();
  var opeartion = "F";
  var select ="p1";

  EmployeeProvider provider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AddEmployee..."),
      ),
      body: SingleChildScrollView(
        child : Form(
          child:Padding(
            padding: EdgeInsets.all(10),
            child :Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ename : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _ename,
                  keyboardType: TextInputType.text,
                  decoration:InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Salary : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _salary,
                  keyboardType: TextInputType.number,
                  decoration:InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Gender : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Radio(
                      groupValue: opeartion,
                      value: "F",
                      onChanged: (val)
                      {
                        setState(() {
                          opeartion=val;
                        });
                      },
                    ),
                    Text("Female"),
                    SizedBox(width: 50,),
                    Radio(
                      groupValue: opeartion,
                      value: "M",
                      onChanged: (val)
                      {
                        setState(() {
                          opeartion=val;
                        });
                      },
                    ),
                    Text("Male"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Department : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    DropdownButton(
                      value: select,
                      onChanged: (val)
                      {
                        setState(() {
                          select=val;
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text("Purchase Management"),
                          value: "p1",
                        ),
                        DropdownMenuItem(
                          child: Text("Sales Management"),
                          value: "s1",
                        ),
                        DropdownMenuItem(
                          child: Text("Accounting Management"),
                          value: "a1",
                        ),
                        DropdownMenuItem(
                          child: Text("Marketing Management"),
                          value: "m1",
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                MyPrimaryButton(
                  onclick: () async{
                    var enm = _ename.text.toString();
                    var sal = _salary.text.toString();


                    if(enm=="")
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
                    else if(sal=="")
                      {
                        Fluttertoast.showToast(
                            msg: "Please Enter Salary",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    else if(select=="")
                    {
                      Fluttertoast.showToast(
                          msg: "Please Enter Department",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }
                    else if(opeartion=="")
                    {
                      Fluttertoast.showToast(
                          msg: "Please Enter Gender",
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
                        Map<String,String> params =    {
                          "ename":enm,
                          "salary":sal,
                          "department":select,
                          "gender":opeartion,
                        };

                        await provider.addEmployee(context, params);
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
                              MaterialPageRoute(builder: (context)=>ViewEmployee())
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
                    // Uri url = Uri.parse(UrlResources.ADD_EMPLOYEE);
                    // var response = await http.post(url,body:
                    // {
                    //   "ename":enm,
                    //   "salary":sal,
                    //   "department":select,
                    //   "gender":opeartion,
                    // });
                    // if(response.statusCode==200)
                    // {
                    //   var body = response.body.toString();
                    //   var json = jsonDecode(body);
                    //   var message = json["message"];
                    //   var status = json["status"];
                    //   print(message);
                    // }
                    // else
                    // {
                    //   print("API ERROR");
                    // }
                  },
                  buttontext: "Submit",
                )
                // Center(
                //   child: Container(
                //     width: MediaQuery.of(context).size.width,
                //     child:ElevatedButton(
                //         onPressed: () async{
                //
                //         },
                //         child: Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)) ,
                //   ),
               // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
