import 'package:flutter/material.dart';
import 'package:wanna_plant/History/historyScreen.dart';
import 'package:wanna_plant/area/regis_land_Screen.dart';
import 'package:wanna_plant/area/upload_imageScreen.dart';
import 'package:wanna_plant/favorite/favoriteScreen.dart';
import 'package:wanna_plant/identify/identifyScreen.dart';
import 'package:wanna_plant/identify/waitIdentifyScreen.dart';
import 'package:wanna_plant/login/forgot_passwordScreen.dart';
import 'package:wanna_plant/login/loginScreen.dart';
import 'package:wanna_plant/manage_account/edit_acc_screen.dart';
import 'package:wanna_plant/signup/signupScreen.dart';
import 'package:wanna_plant/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HistoryScreen(),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/welcome',
      // routes: {
      //   '/welcome': (context) => WelcomeScreen(),
      //   '/login': (context) => LoginScreen(),
      //   '/forgot_password': (context) => Forgot_passwordScreen(),
      //   '/signup': (context) => SignUpScreen(),
      //   '/Register_land': (context) => Regis_land_Screen(),
      //   '/Identity': (context) => IdentifyScreen(),
      //   '/Wait_identity': (context) => WaitIdentifyScreen(),
      // },
    );
  }
}
