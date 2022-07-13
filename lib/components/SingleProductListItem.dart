import 'package:flutter/material.dart';
import 'package:mvvm/providers/ProductProvider.dart';
import 'package:mvvm/views/product/UpdateProduct.dart';

import '../models/Products.dart';

class SingleProductListItem extends StatelessWidget {


  GestureTapCallback onclick;

  Products obj;
  VoidCallback deleteclick;
  VoidCallback updateclick;

  SingleProductListItem({this.onclick,this.obj,this.deleteclick,this.updateclick});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onclick,
      child: Container(
        child: Card(
          color: Colors.blueGrey,
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              // Image.network(alldata[index].imageLink.toString(),),
              SizedBox(height: 20,),
              Text("Pname : "+obj.pname.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("Qty : "+obj.qty.toString(),style: TextStyle(color: Colors.white)),
              SizedBox(height: 20,),
              Text("Price : "+obj.price.toString(),style: TextStyle(color: Colors.white)),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ElevatedButton(
                      onPressed: (){
                       var pid = obj.pid.toString();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>UpdateProduct(updatepid: pid,))
                        );
                        updateclick;
                      },
                      child: Text("Update"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    child: ElevatedButton(
                      onPressed: deleteclick,
                      child: Text("Delete"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
