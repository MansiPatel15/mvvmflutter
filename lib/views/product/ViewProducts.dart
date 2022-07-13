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
import 'package:mvvm/views/product/UpdateProduct.dart';
import 'package:mvvm/views/product/ViewProductSecond.dart';
import 'package:provider/provider.dart';

import '../../models/Products.dart';

class ViewProducts extends StatefulWidget {

  @override
  State<ViewProducts> createState() => _ViewProductsState();
}

class _ViewProductsState extends State<ViewProducts> {

  ProductProvider provider;

  getdata() async
  {
    await provider.getAllProducts(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct..."),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ViewProductSecond())
            );
          }, icon: Icon(Icons.star))
        ],
      ),
      body: (provider.alldata!=null)?
      ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return SingleProductListItem(
             onclick: ()async{},
            updateclick: ()async{
              ElevatedButton(
                  onPressed: () async {
                    var pid = provider.alldata[index].pid.toString();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>UpdateProduct(updatepid: pid,))
                    );
                  },
                  child: Text("ProviderUpdate"));
            },
            deleteclick: () async{
              Map<String,String> params = {
                "pid":provider.alldata[index].pid.toString()
              };
              await provider.deleteProduct(context, params);
              if(provider.isdeleted)
              {
                await provider.getAllProducts(context);
                Fluttertoast.showToast(
                    msg: "Product Deleted Successfully",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                //print("Deleted");
              }
              else
              {
                print("Not Deleted");
              }
            },
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
