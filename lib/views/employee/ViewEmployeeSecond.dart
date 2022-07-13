import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/SingleEmployeeListItem.dart';
import '../../providers/EmployeeProvider.dart';

class ViewEmployeeSecond extends StatefulWidget {
  @override
  State<ViewEmployeeSecond> createState() => _ViewEmployeeSecondState();
}

class _ViewEmployeeSecondState extends State<ViewEmployeeSecond> {
  EmployeeProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<EmployeeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<EmployeeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewSecond..."),
      ),
      body: (provider.alldata != null)
          ? ListView.builder(
              itemCount: provider.alldata.length,
              itemBuilder: (context, index) {
                return SingleEmployeeListItem(
                  onclick: () {},
                  obj: provider.alldata[index],
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
