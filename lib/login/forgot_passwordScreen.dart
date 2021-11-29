import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';

class Forgot_passwordScreen extends StatefulWidget {
  const Forgot_passwordScreen({Key? key}) : super(key: key);

  @override
  State<Forgot_passwordScreen> createState() => _Forgot_passwordScreenState();
}

class _Forgot_passwordScreenState extends State<Forgot_passwordScreen> {
  TextEditingController new_pass = TextEditingController();
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
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: sizeH * 0.03, right: sizeW * 0.89),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xFFDEDEDE),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: sizeW * 1.3 / 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(45),
                    child: Container(
                      margin: EdgeInsets.only(top: 45),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New password',
                            style: TextStyle(
                              fontSize: sizeW * 0.3 / 11,
                              color: Color(0xFFA6A6A6),
                            ),
                          ),
                          TextField(
                            controller: new_pass,
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
                            height: sizeH * 0.06,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: SizedBox(
                              width: sizeW,
                              height: sizeH * 2.5 / 44,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'login');
                                },
                                child: Text('Confirm'),
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
