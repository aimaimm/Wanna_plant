import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/History/HistoryDetailCustomer.dart';
import 'package:wanna_plant/History/HistoryDetailPlanter.dart';
import 'package:wanna_plant/homepage/homepage_seeAllScrenn.dart';
import 'package:wanna_plant/manage_account/edit_acc_screen.dart';
import 'package:wanna_plant/profile/cartScreen.dart';
import 'package:wanna_plant/profile/profileScreen.dart';
import 'package:wanna_plant/signup/textInfo.dart';
import 'package:wanna_plant/tracking/TrackCustomer.dart';
import 'package:wanna_plant/tracking/TrackingSuccess.dart';

import 'package:wanna_plant/chatScreen.dart';
import 'package:wanna_plant/favorite/favoriteScreen.dart';
import 'package:wanna_plant/homepage/homeScreen.dart';
import 'package:wanna_plant/tracking/trackplanter.dart';
import 'package:wanna_plant/History/historyScreen.dart';
import 'package:wanna_plant/area/regis_land_Screen.dart';
import 'package:wanna_plant/area/upload_imageScreen.dart';
import 'package:wanna_plant/favorite/favoriteScreen.dart';
import 'package:wanna_plant/identify/identifyScreen.dart';
import 'package:wanna_plant/identify/waitIdentifyScreen.dart';
import 'package:wanna_plant/login/forgot_passwordScreen.dart';
import 'package:wanna_plant/login/loginScreen.dart';

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
        primarySwatch: Colors.green,
      ),
      // home: HistoryPlanter(),

      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        // '/bottom_bar_linkpage': (context) => LinkPage(),
        '/login': (context) => LoginScreen(),
        '/forgot_password': (context) => Forgot_passwordScreen(),
        '/signup': (context) => SignUpScreen(),
        '/Register_land': (context) => Regis_land_Screen(),
        '/Identity': (context) => IdentifyScreen(
              name: name.text,
              username: username.text,
              password: password.text,
              phonenumber: phonenumber.text,
              address: address.text,
              province: val_province!,
              protmptpay: protmptpay.text,
              size: size!,
              descrip: descrip!,
              val: val!,
              entries: entries,
              imageFileList: imageFileList,
              infoland: infoland,
            ),
        // '/Wait_identity': (context) => WaitIdentifyScreen(),
        '/Favorite': (context) => FavoriteScreen(
              userdata: userdata,
            ),
        '/edit_acc': (context) => Edit_acc_screen(
              userdata: userdata,
            ),
        '/History': (context) => HistoryScreen(
              datauser: userdata,
            ),
        '/History_Customer': (context) => HistoryCustomer(
              datauser: userdata,
              datacustomer: data_customer.length == 1
                  ? data_customer
                  : [data_customer[indexact]],
              nameplanter: name_planter.length == 1
                  ? name_planter
                  : [name_planter[indexact]],
            ),
        '/History_planter': (context) => HistoryPlanter(
              datauser: userdata,
              dataplanter: data_planter.length == 1
                  ? data_planter
                  : [data_planter[indexact]],
              namecustomer: name_customer.length == 1
                  ? name_customer
                  : [name_customer[indexact]],
            ),
        '/Homepage': (context) => Home(
              userdata: userdata,
            ),
        '/Homepage_seeall': (context) => Seeallscreen(
              data_land: data_land,
              userdata: userdata,
            ),
        '/Profile': (context) => profileScreen(
              datauser: userdata,
            ),
        '/Cart': (context) => cartScreen(),
        '/Tracking_customer': (context) => TrackCustomer(
              userdata: userdata,
            ),
        // '/Tracking_planter': (context) => TrackPlanter(),
        // '/Tracking_success': (context) => TrackingSuccess(),
      },
    );
  }
}
