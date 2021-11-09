import 'package:flutter/material.dart';
import 'package:wanna_plant/HistoryDetailCustomer.dart';
import 'package:wanna_plant/HistoryDetailPlanter.dart';
import 'package:wanna_plant/TrackCustomer.dart';
import 'package:wanna_plant/TrackingSuccess.dart';
import 'package:wanna_plant/bottomBar.dart';
import 'package:wanna_plant/chatScreen.dart';
import 'package:wanna_plant/favorite/favoriteScreen.dart';
import 'package:wanna_plant/history.dart';
import 'package:wanna_plant/homepage/homeScreen.dart';
import 'package:wanna_plant/landScreen.dart';
import 'package:wanna_plant/loginScreen.dart';
import 'package:wanna_plant/signupScreen.dart';
import 'package:wanna_plant/trackplanter.dart';
import 'package:wanna_plant/welcomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.green,
      ),
      home: HistoryCustomer(),
      debugShowCheckedModeBanner: false,
    );
  }
}
