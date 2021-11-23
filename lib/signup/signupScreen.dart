import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/signup/textInfo.dart';

class SignUpScreen extends StatefulWidget {
  // const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //  _signup() {
  //     var Name = name.text;
  //     var Username = username.text;
  //     signup.add(Name);
  //     print(signup);
  //     setState(() {

  //     });
  //   }

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
          children: [
            Container(
              height: sizeH / 8,
              child: Row(
                children: [
                  Container(
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
            textInfo(),
            SizedBox(
              height: sizeH * 0.01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 44,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Register_land');
                  },
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
              height: sizeH * 0.01,
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
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
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
