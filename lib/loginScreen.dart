import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wanna_plant/welcomeScreen.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                    padding: EdgeInsets.only(top: 40, right: 330),
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color(0xFFDEDEDE),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20.0, right: 280),
                    //margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w600),
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
                            fontSize: 11.0,
                            color: Color(0xFFA6A6A6),
                          ),
                        ),
                        TextField(
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
                          height: 28.0,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 11.0,
                            color: Color(0xFFA6A6A6),
                          ),
                        ),
                        TextField(
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
                        Container(
                          alignment: Alignment.centerRight,
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: GestureDetector(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Color(0xFF7CC671),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 44,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('LOGIN'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Color(0xFF7CC671),
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
                          height: 18.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                  fontSize: 12.0,
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
