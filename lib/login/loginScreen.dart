import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/welcomeScreen.dart';
import 'package:http/http.dart' as http;

List userdata = [];

class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String error = '';
  bool hidepass = true;
  Widget btnpass = Icon(Icons.visibility, color: Color(0xFFA6A6A6));

  // Map<String, dynamic> login = {'username': 'aimaim', 'password': '1234'};

  _login() async {
    Uri uri_login = Uri.http(url, '/login');
    try {
      http.Response respons = await http.post(uri_login, body: {
        "username": username.text,
        "password": password.text,
      });
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Center(
                  child: CircularProgressIndicator(),
                ));
          });
      if (respons.statusCode == 200) {
        userdata = jsonDecode(respons.body);
        setState(() {
          Navigator.of(context).pop();
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/Homepage',
            ModalRoute.withName('/Homepage'),
          ); //Home
        });
      } else {
        Navigator.of(context).pop();
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Icon(
                  Icons.no_accounts_outlined,
                  color: Colors.red.shade400,
                  size: 70,
                ),
                content: Text(
                  '${respons.body}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color: Colors.grey.shade300)))),
                    ),
                  ),
                ],
              );
            });
        print(respons.body);
        print(respons.statusCode);
      }
    } catch (e) {
      print(e);
      print("connection error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'assets/images/top_login.svg',
                alignment: Alignment.topCenter,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    padding:
                        EdgeInsets.only(top: sizeH * 0.05, right: sizeW * 0.85),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFDEDEDE),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(top: sizeH * 0.02, right: sizeW * 0.7),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: sizeW * 1.3 / 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: sizeW * 0.3 / 11,
                            color: Color(0xFFA6A6A6),
                          ),
                        ),
                        TextField(
                          controller: username,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeH * 1.3 / 28.0,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: sizeW * 0.3 / 11.0,
                            color: Color(0xFFA6A6A6),
                          ),
                        ),
                        TextField(
                          controller: password,
                          obscureText: hidepass,
                          decoration: InputDecoration(
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (hidepass == true) {
                                    btnpass = Icon(Icons.visibility_off);
                                    hidepass = false;
                                  } else {
                                    btnpass = Icon(Icons.visibility);
                                    hidepass = true;
                                  }
                                });
                              },
                              icon: btnpass,
                            ),
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black26),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black38),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$error',
                              style: TextStyle(
                                fontSize: sizeW * 0.21 / 11.0,
                                color: Colors.red,
                              ),
                            ),
                            Container(
                              //alignment: Alignment.centerRight,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: GestureDetector(
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    fontSize: sizeW * 0.24 / 10.0,
                                    color: Color(0xFF7CC671),
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/forgot_password');
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: SizedBox(
                            width: sizeW,
                            height: sizeH * 2.5 / 44,
                            child: TextButton(
                              onPressed: _login,
                              child: Text('LOGIN'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: gbase,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(13.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sizeH * 0.6 / 18.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: sizeW * 0.3 / 12.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: sizeW * 0.3 / 12.0,
                                  color: Color(0xFF7CC671),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: SvgPicture.asset(
              'assets/images/bottom_login.svg',
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
