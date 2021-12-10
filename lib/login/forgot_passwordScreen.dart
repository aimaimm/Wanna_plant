import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:http/http.dart' as http;

class Forgot_passwordScreen extends StatefulWidget {
  const Forgot_passwordScreen({Key? key}) : super(key: key);

  @override
  State<Forgot_passwordScreen> createState() => _Forgot_passwordScreenState();
}

class _Forgot_passwordScreenState extends State<Forgot_passwordScreen> {
  TextEditingController new_pass = TextEditingController();
  TextEditingController txtusername = TextEditingController();

  Future<void> resetpassword() async {
    Uri uri_resetpass = Uri.http(url, "/resetpass");
    try {
      http.Response response_resetpass = await http.post(uri_resetpass, body: {
        'username': txtusername.text,
        'new_pass': new_pass.text,
        'check_role': "guest",
      });
      if (response_resetpass.statusCode == 200) {
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
                  Icons.check_circle_outline,
                  color: gbase,
                  size: 70,
                ),
                content: Text(
                  'Reset password success',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, '/login');
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
                  '${response_resetpass.body}',
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
        print(response_resetpass.body);
        print(response_resetpass.statusCode);
      }
    } catch (e) {
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
                            'Username',
                            style: TextStyle(
                              fontSize: sizeW * 0.3 / 11,
                              color: Color(0xFFA6A6A6),
                            ),
                          ),
                          TextField(
                            controller: txtusername,
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
                            height: 20,
                          ),
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
                                  showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (BuildContext) {
                                        return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                            ),
                                            title: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ));
                                      });
                                  resetpassword();
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
