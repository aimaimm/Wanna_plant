import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
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
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 8,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.red),
              // ),
              child: Row(
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black),
                    // ),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SIGN UP',
                            style: TextStyle(
                                color: gbase,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Create a new account',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child:
                          SvgPicture.asset('assets/images/nature_signup.svg'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Your name',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
                fillColor: txtg,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
                fillColor: txtg,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
                fillColor: txtg,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Contact',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 13,
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Phone number',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
                fillColor: txtg,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              //margin: EdgeInsets.all(12),
              height: 5 * 24.0,
              child: TextField(
                maxLines: 5,
                style: TextStyle(
                  fontSize: 12,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'Address',
                  hintStyle: TextStyle(
                    fontSize: 10,
                  ),
                  fillColor: txtg,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Transfer',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(
              height: 13,
            ),
            TextField(
              style: TextStyle(fontSize: 12),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Protmptpay',
                hintStyle: TextStyle(
                  fontSize: 10,
                ),
                fillColor: txtg,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Next'),
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
                  "Already have an account? ",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Login',
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
    );
  }
}
