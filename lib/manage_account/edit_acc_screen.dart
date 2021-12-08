import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/login/loginScreen.dart';
import 'package:wanna_plant/manage_account/edit_txt.dart';
import 'package:http/http.dart' as http;

class Edit_acc_screen extends StatefulWidget {
  const Edit_acc_screen({
    Key? key,
    required this.userdata,
  }) : super(key: key);

  final List userdata;

  @override
  _Edit_acc_screenState createState() => _Edit_acc_screenState();
}

class _Edit_acc_screenState extends State<Edit_acc_screen> {
  Future<void> saveeditaccount() async {
    Uri uri_saveeditaccount = Uri.http(url, "/saveeditacc");
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
      http.Response response_edit = await http.post(uri_saveeditaccount, body: {
        'user_id': widget.userdata[0]['user_id'].toString(),
        'name': name.text,
        'phonenumber': phone.text,
        'address': address.text,
        'promptpay': protmpt.text,
        'check_role': "user",
      });
      if (response_edit.statusCode == 200) {
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
                  Icons.check_circle_outline_outlined,
                  color: gbase,
                  size: 70,
                ),
                content: Text(
                  'Saved!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        userdata[0]['name'] = name.text;
                        userdata[0]['phonenumber'] = phone.text;
                        userdata[0]['address'] = address.text;
                        userdata[0]['promptpay'] = protmpt.text;
                        Navigator.of(context).pop();
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
      } else {
        Navigator.of(context).pop();
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
                  '${response_edit.body}',
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
        print(response_edit.body);
        print(response_edit.statusCode);
      }
    } catch (e) {
      Navigator.of(context).pop();
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
                'Connection error',
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: Colors.grey.shade300)))),
                  ),
                ),
              ],
            );
          });
      print(e);
      print("connection error");
    }
  }

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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          // padding: const EdgeInsets.only(left: 20, right: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Account',
                style: TextStyle(
                    color: gbase, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Edit your account',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: sizeH / 25,
              ),
              edit_txt(
                userdata: widget.userdata,
              ),
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
                      saveeditaccount();
                    },
                    child: Text('Save'),
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
            ],
          ),
        ),
      ),
    );
  }
}
