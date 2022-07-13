import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/SingleAnimalsListItem.dart';
import '../../providers/AnimalsProvider.dart';

class ViewAnimalsSecond extends StatefulWidget {

  @override
  State<ViewAnimalsSecond> createState() => _ViewAnimalsSecondState();
}

class _ViewAnimalsSecondState extends State<ViewAnimalsSecond> {
  AnimalsProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AnimalsProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AnimalsProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("ViewAnimalsSecond..."),
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
