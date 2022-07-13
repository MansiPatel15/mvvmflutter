import 'package:flutter/material.dart';
import 'package:mvvm/components/SinglePraticeListItem.dart';
import 'package:mvvm/providers/AnimalsProvider.dart';
import 'package:mvvm/providers/EmployeeProvider.dart';
import 'package:mvvm/providers/PraticeProvider.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/views/animals/ModelViewAnimals.dart';
import 'package:mvvm/views/auth/LoginScreen.dart';
import 'package:mvvm/views/employee/ViewEmployee.dart';
import 'package:mvvm/views/home/HomePage.dart';
import 'package:mvvm/views/pratice/ViewPratice.dart';
import 'package:mvvm/views/product/ViewProducts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
        ChangeNotifierProvider(create: (context) => AnimalsProvider()),
        ChangeNotifierProvider(create: (context) => PraticeProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home:  ViewPratice() ,
      ),
    );
  }
}


