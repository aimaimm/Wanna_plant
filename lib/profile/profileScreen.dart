import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/area/regis_land_Screen.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/login/loginScreen.dart';
import 'package:wanna_plant/profile/cartScreen.dart';
import 'package:http/http.dart' as http;

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key, required this.datauser}) : super(key: key);

  final List datauser;

  @override
  _profileScreenState createState() => _profileScreenState();
}

List user_profile = [];

class _profileScreenState extends State<profileScreen> {
  bool isVisible = true;
  bool identify = true;
  bool planter = true;
  bool buildui = false;
  List pictureland = [];
  double rating_count = 0;
  int planted_count = 0;
  String setroleText() {
    if (widget.datauser[0]['role'] == 2) {
      return "Now you're planter and customer";
    } else {
      return "Now you're customer";
    }
  }

  void downloandpic() async {
    Uri uri = Uri.http(url, "/profilepic");
    Uri uri_rating_planted = Uri.http(url, "/countratingandplanted");
    try {
      http.Response response = await http.post(uri, body: {
        "user_id": widget.datauser[0]['user_id'].toString(),
        "check_role": "user"
      });
      http.Response response_count = await http.post(uri_rating_planted, body: {
        'user_id': widget.datauser[0]['user_id'].toString(),
        "check_role": "user",
      });
      if (response.statusCode == 200 && response_count.statusCode == 200) {
        pictureland = jsonDecode(response.body);
        List count_rating_planter = jsonDecode(response_count.body);
        // print(count_rating_planter);
        rating_count = count_rating_planter[0]['rating'] == null
            ? 0
            : count_rating_planter[0]['rating'].roundToDouble();
        planted_count = count_rating_planter[0]['planted'] == null
            ? 0
            : count_rating_planter[0]['planted'];
        // print(pictureland);
        setState(() {
          buildui = true;
          if (widget.datauser[0]['identify'] == 0) {
            identify = false;
          }
          if (widget.datauser[0]['role'] == 1) {
            planter = false;
            isVisible = false;
          }
        });
      } else {
        print(response.body);
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("Connection error");
    }
  }

  @override
  void initState() {
    // print(widget.datauser);
    downloandpic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return buildui
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 5, top: 3),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => cartScreen(
                            datauser: userdata,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart_outlined,
                        size: 25, color: Colors.black),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300),
                      right: BorderSide(color: Colors.grey.shade300),
                      top: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              // fit: BoxFit.scaleDown,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        'assets/images/man-square.jpg',
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${widget.datauser[0]['name']}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    setroleText(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: size.height * 0.05,
                                    width: size.width * 0.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color: identify == false
                                          ? Colors.red.shade100
                                          : Colors.greenAccent.shade100,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                            identify == false
                                                ? Icons.close
                                                : Icons.done_all,
                                            color: Colors.grey.shade700),
                                        Text(
                                          identify == true
                                              ? 'Success for Identify'
                                              : 'Unsuccess for Identify',
                                          style: TextStyle(
                                              color: Colors.grey.shade700),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '$rating_count',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              "Rating",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              right: 16.0, left: 16.0),
                                          child: Container(
                                            height: 45,
                                            decoration: BoxDecoration(
                                              border: Border(
                                                left: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5),
                                                right: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5),
                                                top: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5),
                                                bottom: BorderSide(
                                                    color: Colors.grey,
                                                    width: 0.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '$planted_count',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300),
                                            ),
                                            Text(
                                              "Planted",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Visibility(
                                visible: isVisible,
                                child: Text(
                                  'Photos',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Visibility(
                                visible: isVisible,
                                child: Container(
                                  width: size.width,
                                  height: 141,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: pictureland.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 150,
                                        height: 130,
                                        padding: EdgeInsets.all(5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                              'http://$url/${pictureland[index]['pic_name']}',
                                              // width: 130,
                                              // height: 130,
                                              fit: BoxFit.cover),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: size.width,
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.grey.shade100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: TextButton.icon(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/edit_acc");
                                        },
                                        icon: Icon(Icons.account_circle,
                                            color: Colors.grey.shade600),
                                        label: Text(
                                          'Manage Account',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13),
                                        ),
                                        style: ButtonStyle(
                                            alignment: Alignment.centerLeft),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextButton.icon(
                                      onPressed: planter == true
                                          ? null
                                          : () {
                                              check_role_profile = "user";
                                              user_profile = widget.datauser;
                                              Navigator.pushNamed(
                                                  context, '/Register_land');
                                            },
                                      icon: Icon(
                                        planter == true
                                            ? Icons.check_circle_outline
                                            : Icons.terrain,
                                        color: planter == true
                                            ? Colors.lightGreen.shade400
                                            : Colors.grey.shade600,
                                      ),
                                      label: Text(
                                        planter == true
                                            ? 'Now, You be are planter and customer'
                                            : 'Register to be planter',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                      style: ButtonStyle(
                                          alignment: Alignment.centerLeft),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: planter == true
                                      ? null
                                      : Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.grey.shade600,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/contactus');
                                      },
                                      icon: Icon(
                                        Icons.phone_outlined,
                                        color: Colors.grey.shade600,
                                      ),
                                      label: Text(
                                        'Contact Us',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                      style: ButtonStyle(
                                          alignment: Alignment.centerLeft),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: size.height * 0.05,
                          width: size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: TextButton.icon(
                                      onPressed: () {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          '/welcome',
                                          ModalRoute.withName('/welcome'),
                                        ); //Home
                                      },
                                      icon: Icon(
                                        Icons.logout_outlined,
                                        color: Colors.grey.shade600,
                                      ),
                                      label: Text(
                                        'Log Out',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                      style: ButtonStyle(
                                          alignment: Alignment.centerLeft),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomBar(),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
