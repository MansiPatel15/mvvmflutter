import 'package:flutter/material.dart';
import 'package:mvvm/views/animals/AnimalDetails.dart';
import 'package:mvvm/views/animals/ModelViewAnimals.dart';
import 'package:mvvm/views/employee/ViewEmployee.dart';
import 'package:mvvm/views/product/AddProduct.dart';
import 'package:mvvm/views/product/ViewProducts.dart';

import '../employee/AddEmployee.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage...."),
      ),
     // body: Text("Drawer Example",style: TextStyle(fontSize: 15),),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: Text("M"),
              ),
              accountName: Text("Mansi Patel.."),
              accountEmail: Text("mansippatel.0105gmail.com"),
            ),
            ListTile(
              leading: Icon(Icons.person_add),
              title: Text("AddEmployee"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddEmployee())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("ViewEmployee"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewEmployee())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_outlined),
              title: Text("AddProduct"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddProduct())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_sharp),
              title: Text("ViewProducts"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewProducts())
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.production_quantity_limits_sharp),
              title: Text("ViewAnimals"),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ModelViewAnimals())
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
