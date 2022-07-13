import 'package:flutter/material.dart';
import 'package:mvvm/models/Animals.dart';

class SingleAnimalsListItem extends StatelessWidget {

  GestureTapCallback onclick;

  Animals obj;

  SingleAnimalsListItem({this.onclick, this.obj});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        child: Card(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(obj.imageLink.toString()),
              Text(
                "Name : " + obj.name.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Latin-Name : " + obj.latinName.toString(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Animal Type : " + obj.animalType.toString(),
                style: TextStyle(fontSize: 18, color: Color(0XFF424242)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Habitat : " + obj.habitat.toString(),
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0XFF424242),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
