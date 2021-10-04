import 'package:flutter/material.dart';

class LandSreen extends StatefulWidget {
  // const LandSreen({ Key? key }) : super(key: key);

  @override
  _LandSreenState createState() => _LandSreenState();
}

class _LandSreenState extends State<LandSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFDEDEDE),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
