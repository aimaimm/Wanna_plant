import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';

class IdentifyScreen extends StatefulWidget {
  //const IdentifyScreen({ Key? key }) : super(key: key);

  @override
  _IdentifyScreenState createState() => _IdentifyScreenState();
}

class _IdentifyScreenState extends State<IdentifyScreen> {
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 120,
            child: SvgPicture.asset('assets/images/identify_top_right.svg'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.only(top: 40),
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xFFDEDEDE),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Identity Verification',
                      style: TextStyle(
                        color: gbase,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('we need to vertify Information'),
                    Text('Please submit the document'),
                    Text('below to process you application'),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      elevation: 0,
                      color: txtg,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Image.asset('assets/images/scan.png'),
                        title: Text('Face Photo'),
                        trailing: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gbase,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      elevation: 0,
                      color: txtg,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Image.asset('assets/images/idCard.png'),
                        title: Text('ID Card'),
                        trailing: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: gbase,
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            activeColor: gbase,
                            value: _checkbox,
                            onChanged: (value) {
                              setState(() {
                                _checkbox = !_checkbox;
                              });
                            }),
                        Text(
                          'I agree to provide the requested information.',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 44,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('SUBMIT'),
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
            ],
          ),
        ],
      ),
    );
  }
}
