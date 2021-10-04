import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  // const WelcomeScreen({ Key? key }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Wanna',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 7.0,
              ),
              Text(
                'Plant',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7CC671),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 48.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 250.0,
            child: SvgPicture.asset(
              'assets/images/firstLogin.svg',
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          SizedBox(
            width: 218,
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
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: 218,
            height: 44,
            child: TextButton(
              onPressed: () {},
              child: Text('SIGNUP'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                //backgroundColor: Color(0xFF7CC671),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(13.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
