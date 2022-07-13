import 'package:flutter/material.dart';

import '../resources/StringResources.dart';
import '../resources/StyleResources.dart';

class MyPrimaryButton extends StatelessWidget {

  var buttontext="";
  GestureTapCallback onclick;

  MyPrimaryButton({this.buttontext,this.onclick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: 700,
      decoration: BoxDecoration(
          color: StyleResources.primaryButtonColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: GestureDetector(
        onTap: onclick,
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
          style: StyleResources.buttonText,
        ),
      ),
    );
  }
}
