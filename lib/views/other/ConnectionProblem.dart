import 'package:flutter/material.dart';

class ConnectionProblem extends StatefulWidget {

  @override
  State<ConnectionProblem> createState() => _ConnectionProblemState();
}

class _ConnectionProblemState extends State<ConnectionProblem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("image/2.jpg"),
      ),
    );
  }
}
