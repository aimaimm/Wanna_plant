import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/welcomeScreen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String error = '';

  // Map<String, dynamic> login = {'username': 'aimaim', 'password': '1234'};

  _login() async {
    Uri uri_login = Uri.http(url, '/login');
    try {
      http.Response respons = await http.post(uri_login, body: {
        "username": username.text,
        "password": password.text,
      });
      if (respons.statusCode == 200) {
        
        setState(() {
          Navigator.pushNamedAndRemoveUntil(
              context, '/Homepage', ModalRoute.withName('/Homepage'),
              arguments: respons.body); //Home
        });
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
                          obscureText: true,
                          decoration: InputDecoration(
                            suffix: Icon(
                              Icons.visibility,
                              color: Color(0xFFA6A6A6),
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
