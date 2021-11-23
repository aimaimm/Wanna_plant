import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaitIdentifyScreen extends StatefulWidget {
  //const WaitIdentifyScreen({ Key? key }) : super(key: key);

  @override
  _WaitIdentifyScreenState createState() => _WaitIdentifyScreenState();
}

class _WaitIdentifyScreenState extends State<WaitIdentifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/identify.svg',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Await Review',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Processing will take 1-3 days, including',
              style: TextStyle(fontSize: 10),
            ),
            Text(
              'weekends and holidays. Please wait...',
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 44,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomepageScreen(),
                  //   ),
                  // );
                },
                child: Text(
                  'GO TO HOME',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
          ],
        ),
      ),
    );
  }
}
