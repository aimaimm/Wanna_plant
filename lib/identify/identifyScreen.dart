import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wanna_plant/area/regis_land_Screen.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/identify/IdentifyCard.dart';
import 'package:wanna_plant/identify/alert/Unsuccess_alert.dart';
import 'package:wanna_plant/identify/alert/success_alert.dart';
import 'package:http/http.dart' as http;
import 'package:wanna_plant/signup/textInfo.dart';

class IdentifyScreen extends StatefulWidget {
  const IdentifyScreen({
    Key? key,
    required this.imageFileList,
    required this.name,
    required this.username,
    required this.password,
    required this.phonenumber,
    required this.address,
    required this.protmptpay,
    required this.size,
    required this.descrip,
    required this.val,
    required this.entries,
    required this.infoland,
  }) : super(key: key);

  final String name;
  final String username;
  final String password;
  final String phonenumber;
  final String address;
  final String protmptpay;
  final String size;
  final String descrip;
  final String val;
  final List entries;
  final List<XFile> imageFileList;
  final bool infoland;

  @override
  _IdentifyScreenState createState() => _IdentifyScreenState();
}

class _IdentifyScreenState extends State<IdentifyScreen> {
  bool _checkbox = false;

  Submit() async {
    if (_checkbox == false) {
      Unsuccess(context);
    } else {
      if (face != null && id_card != null) {
        Uri uri = Uri.http(url, '/register');
        Uri uri_land = Uri.http(url, '/registerland');
        // Uri uri_land_picture = Uri.http(url, '/registerlandpicture');

        try {
          if (widget.imageFileList.length != 0 && widget.infoland == true) {
            http.Response response = await http.post(
              uri,
              body: {
                'name': widget.name,
                'username': widget.username,
                'password': widget.password,
                'phonenumber': widget.phonenumber,
                'address': widget.address,
                'protmptpay': widget.protmptpay,
                'identify': "1",
                'role': "2",
                'check_role': "guest",
              },
            );
            if (response.statusCode == 200) {
              http.MultipartRequest requestlandpicture =
                  http.MultipartRequest('POST', uri_land);
              List iduser = jsonDecode(response.body);

              requestlandpicture.fields['size'] = widget.size;
              requestlandpicture.fields['val'] = widget.val;
              requestlandpicture.fields['descrip'] = widget.descrip;
              requestlandpicture.fields['user_id'] = jsonEncode(iduser);
              requestlandpicture.fields['entries'] = jsonEncode(widget.entries);
              requestlandpicture.fields['check_role'] = "guest";
              for (int i = 0; i < widget.imageFileList.length; i++) {
                requestlandpicture.files.add(await http.MultipartFile.fromPath(
                    'fileupload', widget.imageFileList[i].path));
              }
              var res = await requestlandpicture.send();
              if (res.statusCode == 200) {
                successAlert(context);
              }
            }
          } else {
            http.Response response = await http.post(
              uri,
              body: {
                'name': widget.name,
                'username': widget.username,
                'password': widget.password,
                'phonenumber': widget.phonenumber,
                'address': widget.address,
                'protmptpay': widget.protmptpay,
                'identify': "1",
                'role': "1",
                'check_user': "guest",
              },
            );
            if (response.statusCode == 200) {
              successAlert(context);
            } else {
              print('Connection down');
            }
          }
        } catch (e) {
          print(e);
          print('Connection error');
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
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
                  entries.clear();
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
