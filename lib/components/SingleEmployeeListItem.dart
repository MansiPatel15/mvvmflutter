import 'package:flutter/material.dart';
import 'package:mvvm/models/Employee.dart';
import 'package:mvvm/views/employee/UpdateEmployee.dart';

import '../providers/EmployeeProvider.dart';

class SingleEmployeeListItem extends StatelessWidget {


  GestureTapCallback onclick;

  Employee obj;
  EmployeeProvider provider;
  VoidCallback deleteclick;


  SingleEmployeeListItem({this.onclick,this.obj,this.deleteclick});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onclick,
      child: Container(
        child: Card(
          color: Colors.white10,
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Image.network(alldata[index].imageLink.toString(),),
              SizedBox(height: 20,),
              Text("Ename : "+obj.ename.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("Salary : "+obj.salary.toString(),style: TextStyle(color: Colors.black)),
              SizedBox(height: 20,),
              Text("Gender : "+obj.gender.toString(),style: TextStyle(color: Colors.black)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>UpdateEmployee())
                        );
                      },
                      child: Text("Update"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ElevatedButton(
                      onPressed: deleteclick,
                      child: Text("Delete"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
