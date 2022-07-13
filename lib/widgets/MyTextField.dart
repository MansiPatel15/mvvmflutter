import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {

  var hinttext="";
  bool ispassword=false;
  TextEditingController controller;
  TextInputType keyboard;

  MyTextField({this.hinttext,this.ispassword,this.controller,this.keyboard});



  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: ispassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hinttext),
    );
  }
}
