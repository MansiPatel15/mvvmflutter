import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/EmployeeProvider.dart';
import '../../widgets/MyPrimaryButton.dart';

class UpdateEmployee extends StatefulWidget {

  @override
  State<UpdateEmployee> createState() => _UpdateEmployeeState();
}

class _UpdateEmployeeState extends State<UpdateEmployee> {
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
        title: Text("UpdateEmployee..."),
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

                    },
                  buttontext: "Update",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
