import 'package:flutter/material.dart';
import 'package:mvvm/components/SinglePraticeListItem.dart';
import 'package:mvvm/providers/PraticeProvider.dart';
import 'package:provider/provider.dart';

class ViewPratice extends StatefulWidget {

  @override
  State<ViewPratice> createState() => _ViewPraticeState();
}

class _ViewPraticeState extends State<ViewPratice> {

  PraticeProvider provider;

  getdata() async {
    print("View MEthod Called");
    await provider.getAllPratice(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<PraticeProvider>(context, listen: false);
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<PraticeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewPratice..."),
        actions: [
          IconButton(onPressed: (){
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => ViewProductSecond())
            // );
          }, icon: Icon(Icons.star))
        ],
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context, index) {
          return SinglePraticeListItem(
            onclick: () {
              setState(() {
                provider.alldata.removeAt(index);
              });
            },
            obj: provider.alldata[index],
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
