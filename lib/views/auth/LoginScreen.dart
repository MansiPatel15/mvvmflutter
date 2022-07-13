import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/resources/StringResources.dart';
import 'package:mvvm/resources/StyleResources.dart';

import '../../widgets/MyPrimaryButton.dart';
import '../../widgets/MyTextField.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();


  _loginbtn()
  {
    return Center(
      child: MyPrimaryButton(
        buttontext: "Login",
        onclick: (){

        },
      ) ,
    );
  }

  _loginform()
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Enter Your MobileNumber : ",
          style: StyleResources.lableText,
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField(
          controller: _mobile,
          hinttext: "Enter Mobile",
          ispassword: false,
          keyboard: TextInputType.phone,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Enter Your Password : ",
          style: StyleResources.lableText,
        ),
        SizedBox(
          height: 20,
        ),
        MyTextField(
          controller: _password,
          hinttext: "Enter Password",
          ispassword: true,
          keyboard: TextInputType.text,
        ),
        SizedBox(
          height: 20,
        ),
        _loginbtn(),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegisterScreen()));
              },
              child: Text("Create New Account",style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),),
            ),
          ) ,
        )

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: _loginform(),
          ),
        ),
      ),
    );
  }
}
