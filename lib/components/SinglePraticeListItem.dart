import 'package:flutter/material.dart';
import 'package:mvvm/providers/PraticeProvider.dart';

import '../models/Pratice.dart';

class SinglePraticeListItem extends StatelessWidget {
  GestureTapCallback onclick;
  Pratice obj;

  SinglePraticeListItem({this.onclick, this.obj});

  PraticeProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 560,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3.8,
                    child: Column(
                      children: [
                        Image.network(obj.userimage),
                        Text(
                          "ID : " + obj.id.toString(),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : " + obj.name.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Email : " + obj.email.toString(),
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Address : " + obj.address.toString(),
                          style: TextStyle(
                            color: Colors.black,),
                        ),
                        (obj.gender=="female")?Row(
                          children: [
                            Text("F",style: TextStyle(fontWeight: FontWeight.bold),),
                            Text("/"),
                            Text("M"),
                          ],
                        ):Row(
                          children: [
                            Text("F"),
                            Text("/"),
                            Text("M",style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Contact No :",
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                            Column(
                              children: [
                                Text(
                                  "Mobile :  " + obj.phone.mobile.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  "Home :  " + obj.phone.home.toString(),
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: onclick,
                  child: Text(
                    "REMOVE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                decoration: BoxDecoration(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
