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
import 'package:wanna_plant/login/loginScreen.dart';
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
    required this.province,
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
  final String province;
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
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext) {
              return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  title: Center(
                    child: CircularProgressIndicator(),
                  ));
            });
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
                'province': widget.province,
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
              userdata = iduser;

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
                name.text = "";
                username.text = "";
                password.text = "";
                phonenumber.text = "";
                address.text = "";
                protmptpay.text = "";
                imageFileList.clear();
                entries.clear();
                infoland = true;
                plantTEC.clear();
                priceTEC.clear();
                rowCard.clear();
                Navigator.pop(context);
                successAlert(context);
              }
            } else {
              Navigator.pop(context);
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      title: Icon(
                        Icons.error_outline_outlined,
                        color: Colors.red.shade400,
                        size: 70,
                      ),
                      content: Text(
                        '${response.body}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                                alignment: Alignment.center,
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: Colors.grey.shade300)))),
                          ),
                        ),
                      ],
                    );
                  });
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
                'province': widget.province,
                'protmptpay': widget.protmptpay,
                'identify': "1",
                'role': "1",
                'check_role': "guest",
              },
            );
            if (response.statusCode == 200) {
              name.text = "";
              username.text = "";
              password.text = "";
              phonenumber.text = "";
              address.text = "";
              protmptpay.text = "";
              imageFileList.clear();
              entries.clear();
              infoland = true;
              plantTEC.clear();
              priceTEC.clear();
              rowCard.clear();
              Navigator.pop(context);
              userdata = jsonDecode(response.body);
              successAlert(context);
            } else {
              Navigator.pop(context);
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      title: Icon(
                        Icons.error_outline_outlined,
                        color: Colors.red.shade400,
                        size: 70,
                      ),
                      content: Text(
                        '${response.body}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'OK',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                                alignment: Alignment.center,
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                            color: Colors.grey.shade300)))),
                          ),
                        ),
                      ],
                    );
                  });
              print(response.body);
              print(response.statusCode);
              print('Connection down');
            }
          }
        } catch (e) {
          Navigator.pop(context);
          print(e);
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  title: Icon(
                    Icons.error_outline_outlined,
                    color: Colors.red.shade400,
                    size: 70,
                  ),
                  content: Text(
                    'connection error',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: Colors.grey.shade300)))),
                      ),
                    ),
                  ],
                );
              });
          print('Connection error');
        }
      }
    }
  }

  @override
  void initState() {
    print(infoland);
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
                  setState(() {
                    Navigator.pop(context);
                  });
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
