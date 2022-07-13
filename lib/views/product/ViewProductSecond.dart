import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/components/SingleProductListItem.dart';
import 'package:mvvm/helpers/ApiHandler.dart';
import 'package:mvvm/helpers/error_handler.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/resources/UrlResources.dart';
import 'package:mvvm/views/other/NoInternet.dart';
import 'package:provider/provider.dart';

import '../../models/Products.dart';
class ViewProductSecond extends StatefulWidget {

  @override
  State<ViewProductSecond> createState() => _ViewProductSecondState();
}

class _ViewProductSecondState extends State<ViewProductSecond> {
  ProductProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("View second..."),

      ),
      body: (provider.alldata!=null)?
      ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return SingleProductListItem(
            onclick: (){},
            obj: provider.alldata[index],
          );
          // return GestureDetector(
          //   onTap: (){
          //     var pid = alldata[index].pid
          //         .toString();
          //
          //     // Navigator.of(context).push(
          //     //     MaterialPageRoute(builder: (context)=> ModelUpdateProduct())
          //     // );
          //   },
          //   child: Container(
          //     child: Card(
          //       color: Colors.blueGrey,
          //       child:  Column(
          //         mainAxisSize: MainAxisSize.max,
          //         children: [
          //           // Image.network(alldata[index].imageLink.toString(),),
          //           SizedBox(height: 20,),
          //           Text("Pname : "+alldata[index].pname.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          //           SizedBox(height: 20,),
          //           Text("Qty : "+alldata[index].qty.toString(),style: TextStyle(color: Colors.white)),
          //           SizedBox(height: 20,),
          //           Text("Price : "+alldata[index].price.toString(),style: TextStyle(color: Colors.white)),
          //           SizedBox(height: 20,),
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
