import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/identify/IdentifyCard.dart';
import 'package:wanna_plant/identify/alert/Unsuccess_alert.dart';
import 'package:wanna_plant/identify/alert/success_alert.dart';

class IdentifyScreen extends StatefulWidget {
  const IdentifyScreen({
    Key? key,
  }) : super(key: key);

  @override
  _IdentifyScreenState createState() => _IdentifyScreenState();
}

class _IdentifyScreenState extends State<IdentifyScreen> {
  bool _checkbox = false;

  Submit() {
    if (_checkbox == false) {
      Unsuccess(context);
    } else {
      successAlert(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -120,
            right: -20,
            child: Container(
              width: 210,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: gbase.withOpacity(0.2),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.only(top: 40),
                onPressed: () {
                  Navigator.pop(context);
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: sizeH / 60,
                    ),
                    Text(
                      'we need to vertify Information \nPlease submit the document \nbelow to process you application',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: sizeH * 0.05,
                    ),
                    IdentifyCard(),
                    SizedBox(
                      height: sizeH * 0.02,
                    ),
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
                      width: sizeW,
                      height: 44,
                      child: TextButton(
                        onPressed: Submit,
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

class image {
  final String face;
  final String id_card;

  image(this.face, this.id_card);
  @override
  String toString() {
    return 'Kind of Plant: name=';
  }
}
