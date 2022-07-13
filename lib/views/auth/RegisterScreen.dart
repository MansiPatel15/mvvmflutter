import 'package:flutter/material.dart';
import 'package:mvvm/views/auth/LoginScreen.dart';
import 'package:mvvm/widgets/MyPrimaryButton.dart';

import '../../resources/StyleResources.dart';

class RegisterScreen extends StatefulWidget {

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formkey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RegisterScreen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child : Form(
            key: formkey,
            child :Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : ",style: StyleResources.lableText,),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    hintText: 'Enter the Name',
                    isDense: true,
                  ),
                  validator: (val)
                  {
                    if(val.length<=0)
                    {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("MobileNumber : ",style: StyleResources.lableText,),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _mobile,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    hintText: 'Enter the MobileNumber',
                    isDense: true,
                  ),
                  validator: (val)
                  {
                    if(val.length<=0)
                    {
                      return "Plaese Enter MobileNumber";
                    }
                    else if(val.length!=10)
                    {
                      return "Please Enter Valid MobileNumber";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Password : ",style: StyleResources.lableText,),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    hintText: 'Enter the password',
                    isDense: true,
                  ),
                  validator: (val)
                  {
                    if(val.isEmpty)
                    {
                      return "Please Enter Password";
                    }
                    else if(val.length<=6)
                    {
                      return "Please Enter Min 6 Character";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("EmailAddress : ",style: StyleResources.lableText,),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(border: OutlineInputBorder(),
                    hintText: 'Enter the EmailAddress',
                    isDense: true,
                  ),
                  validator: (val){
                    if(val.isEmpty)
                    {
                      return 'Please a Enter EmailAddress';
                    }
                    else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val))
                    {
                      return 'Please  Enter a valid EmailAddress';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: MyPrimaryButton(
                    buttontext: "Register",
                    onclick: (){},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
