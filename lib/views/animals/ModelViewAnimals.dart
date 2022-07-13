import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/components/SingleAnimalsListItem.dart';
import 'package:mvvm/models/Animals.dart';
import 'package:mvvm/providers/AnimalsProvider.dart';
import 'package:mvvm/views/animals/AnimalDetails.dart';
import 'package:mvvm/views/animals/ViewAnimalsSecond.dart';
import 'package:provider/provider.dart';

import '../../helpers/ApiHandler.dart';
import '../../helpers/error_handler.dart';
import '../../resources/UrlResources.dart';
import '../other/ConnectionProblem.dart';
import '../other/NoInternet.dart';

class ModelViewAnimals extends StatefulWidget {

  @override
  State<ModelViewAnimals> createState() => _ModelViewAnimalsState();
}

class _ModelViewAnimalsState extends State<ModelViewAnimals> {

  AnimalsProvider provider;

  getdata() async {
    await provider.getAllAnimals(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AnimalsProvider>(context, listen: false);
    print("init");
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AnimalsProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("ModelViewAnimals..."),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ViewAnimalsSecond()));
              },
              icon: Icon(Icons.star)),
        ],
      ),
      body: (provider.alldata!=null)?
      ListView.builder(
        itemCount:provider. alldata.length,
        itemBuilder: (context,index)
        {
          return SingleAnimalsListItem(
            onclick: () {},
            obj: provider.alldata[index],
          );
          // return GestureDetector(
          //   onTap: (){
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context)=>AnimalDetails(obj: alldata[index]))
          //     );
          //   },
          //   child: Container(
          //     child: Card(
          //       color: Colors.blueGrey,
          //       child:  Column(
          //         mainAxisSize: MainAxisSize.max,
          //         children: [
          //           Image.network(alldata[index].imageLink.toString(),),
          //           SizedBox(height: 20,),
          //           Text("Name : "+alldata[index].name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          //           SizedBox(height: 20,),
          //           Text("LatinName : "+alldata[index].latinName.toString(),style: TextStyle(color: Colors.white)),
          //           SizedBox(height: 20,),
          //           Text("AnimalType : "+alldata[index].animalType.toString(),style: TextStyle(color: Colors.white)),
          //           SizedBox(height: 20,),
          //           Text("Habitat : "+alldata[index].habitat.toString(),style: TextStyle(color: Colors.white))
          //
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
      )
          :Center(child: CircularProgressIndicator()),
    );
  }
}
// body: FutureBuilder(
//   future: alldata,
//   builder: (context, snapshot) {
//     if (snapshot.hasData)
//     {
//       if (snapshot.data.length <= 0)
//       {
//         return Center(child: Text("No Data"));
//       }
//       else
//       {
//         return ListView.builder(
//           itemCount: snapshot.data.length,
//           itemBuilder: (context, index) {
//             return  GestureDetector(
//               onTap: () async {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => RedirectAnimalsData(image: snapshot.data[index]["image_link"].toString(),
//                         name: snapshot.data[index]["name"].toString(),latinname: snapshot.data[index]["latin_name"].toString(),
//                         animaltype:snapshot.data[index]["animal_type"].toString(),
//                         habitat:snapshot.data[index]["habitat"].toString())));
//               },
//               child:  Container(
//                 child: Card(
//                   color: Colors.transparent,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Image.network(snapshot.data[index]
//                       ["image_link"]
//                           .toString()),
//                       Text(
//                         "Name : " +
//                             snapshot.data[index]["name"].toString(),
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Latin-Name : " +
//                             snapshot.data[index]["latin_name"].toString(),
//                         style: TextStyle(fontSize: 18),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Animal Type : " +
//                             snapshot.data[index]["animal_type"]
//                                 .toString(),
//                         style: TextStyle(
//                             fontSize: 18, color: Color(0XFF424242)),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "Habitat : " +
//                             snapshot.data[index]["habitat"].toString(),
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Color(0XFF424242),
//                         ),
//                       ),
//                     ],
//                   ),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//               ),
//             );
//           },
//         );
//       }
//     }
//     else
//     {
//       return Center(child: CircularProgressIndicator());
//     }
//   },
// ),

