import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanna_plant/bottomsheet.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/data/data_planter.dart';
import 'package:wanna_plant/homepage/homepage_seeAllScrenn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.idland,
    required this.datauser,
  }) : super(key: key);

  final int idland;
  final List datauser;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool showBotton_sheet = false;
  bool disable_orderBottom = false;
  bool fav = false;
  bool build_check = false;
  String main_picture = "";
  int selectorder = 0;
  int countorder = 1;

  List detail_land = [];
  void infoland() async {
    Uri uri_infoland = Uri.http(url, "/infoland");
    Uri uri_infolandpic = Uri.http(url, "/infolandpic");
    Uri uri_favbtn = Uri.http(url, "/favbtn");
    try {
      http.Response response = await http.post(uri_infoland,
          body: {'idland': widget.idland.toString(), 'user_check': "user"});
      http.Response response_picture = await http.post(uri_infolandpic,
          body: {'idland': widget.idland.toString(), 'user_check': "user"});

      if (response.statusCode == 200 && response_picture.statusCode == 200) {
        List rawdata_land = jsonDecode(response.body);
        List pic_land = jsonDecode(response_picture.body);
        http.Response response_favbtn = await http.post(uri_favbtn, body: {
          'user_id': widget.datauser[0]['user_id'].toString(),
          'land_id': rawdata_land[0]['land_id'].toString(),
          'check_role': "user",
        });
        if (response_favbtn.statusCode == 200) {
          for (int i = 0; i < rawdata_land.length; i++) {
            // rawdata_land[i]['pic_name'] =
            //     "http://$url/${rawdata_land[i]['pic_name']}";
            if (rawdata_land[i]['land_unit'] == "Square Centimeter") {
              rawdata_land[i]['land_unit'] = "Square CM";
            } else if (rawdata_land[i]['land_unit'] == "Square Meter") {
              rawdata_land[i]['land_unit'] = "Square M";
            } else {
              rawdata_land[i]['land_unit'] = "Square KM";
            }
            if (rawdata_land[i]['rating'] == null) {
              rawdata_land[i]['rating'] = 0;
            }

            if (detail_land.length == 0) {
              detail_land.add(
                {
                  // 'pic_name': rawdata_land[i]['pic_name'],
                  'pic_name': pic_land,
                  'user_id': rawdata_land[i]['user_id'],
                  'province': rawdata_land[i]['province'],
                  'name': rawdata_land[i]['name'],
                  'land_id': rawdata_land[i]['land_id'],
                  'land_area': rawdata_land[i]['land_area'],
                  'land_unit': rawdata_land[i]['land_unit'],
                  'land_description': rawdata_land[i]['land_description'],
                  'plants_name': rawdata_land[i]['plants_name'],
                  'plants_price': rawdata_land[i]['plants_price'],
                  'rating': rawdata_land[i]['rating'],
                  'planted': rawdata_land[i]['planted'],
                },
              );
            } else {
              // if (detail_land[detail_land.length - 1]['pic_name'] !=
              //     rawdata_land[i]['pic_name']) {
              //   List stack_plant = [];

              //   if (detail_land[detail_land.length - 1]['pic_name'] is List) {
              //     for (int p = 0;
              //         p < detail_land[detail_land.length - 1]['pic_name'].length;
              //         p++) {
              //       stack_plant
              //           .add(detail_land[detail_land.length - 1]['pic_name'][p]);
              //     }
              //   } else {
              //     stack_plant
              //         .add(detail_land[detail_land.length - 1]['pic_name']);
              //   }

              //   stack_plant.add(rawdata_land[i]['pic_name']);
              //   detail_land[detail_land.length - 1]['pic_name'] = stack_plant;
              // }
              if (detail_land[detail_land.length - 1]['plants_name'] !=
                  rawdata_land[i]['plants_name']) {
                List stack_plant_name = [];

                if (detail_land[detail_land.length - 1]['plants_name']
                    is List) {
                  for (int p = 0;
                      p <
                          detail_land[detail_land.length - 1]['plants_name']
                              .length;
                      p++) {
                    stack_plant_name.add(
                        detail_land[detail_land.length - 1]['plants_name'][p]);
                  }
                } else {
                  stack_plant_name
                      .add(detail_land[detail_land.length - 1]['plants_name']);
                }

                stack_plant_name.add(rawdata_land[i]['plants_name']);
                detail_land[detail_land.length - 1]['plants_name'] =
                    stack_plant_name;
                List stack_plant_price = [];

                if (detail_land[detail_land.length - 1]['plants_price']
                    is List) {
                  for (int p = 0;
                      p <
                          detail_land[detail_land.length - 1]['plants_price']
                              .length;
                      p++) {
                    stack_plant_price.add(
                        detail_land[detail_land.length - 1]['plants_price'][p]);
                  }
                } else {
                  stack_plant_price
                      .add(detail_land[detail_land.length - 1]['plants_price']);
                }

                stack_plant_price.add(rawdata_land[i]['plants_price']);
                detail_land[detail_land.length - 1]['plants_price'] =
                    stack_plant_price;
              }
            }
          }
          // print(detail_land[0]['pic_name'][0]);
          // for (int i = 0; i < detail_land[0]['pic_name'].length; i++) {
          //   // print(detail_land[0]['pic_name'][i]['pic_name']);
          //   detail_land[0]['pic_name'][i]['pic_name'] =
          //       "http://$url/${detail_land[0]['pic_name'][i]['pic_name']}";
          //   // List stack_plant = [];
          //   // stack_plant.add(detail_land[i - 1]['pic_name']);
          //   // stack_plant.add(rawdata_land[i]['pic_name']);
          //   // detail_land[i - 1]['pic_name'] = stack_plant;
          // }
          main_picture =
              "http://$url/${detail_land[0]['pic_name'][0]['pic_name']}";

          setState(() {
            // print(detail_land[0]['plants_name']);
            // print(detail_land[0]['plants_name'].length);
            List checkfavbtn = jsonDecode(response_favbtn.body);
            if (checkfavbtn.length != 0) {
              fav = true;
            }

            build_check = true;
          });
        }
      }
    } catch (e) {
      print(e);
      print("connection error");
    }
  }

  Future<void> adddatacart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? rawdatacart = prefs.getString('cart');
    // prefs.clear();
    // List datacart = jsonDecode(rawdatacart!);
    // print(detail_land);
    // print(detail_land[0]['plants_price'][0]);
    // int test = detail_land[0]['plants_price'][selectorder].toInt();
    // print(test * countorder);
    if (rawdatacart == null) {
      List addtocart = [];
      if (detail_land[0]['plants_price'] is int) {
        addtocart.add({
          'pic_name':
              "http://$url/${detail_land[0]['pic_name'][0]['pic_name']}",
          'land_id': detail_land[0]['land_id'],
          'land_area': detail_land[0]['land_area'],
          'land_unit': detail_land[0]['land_unit'],
          'plants_name': detail_land[0]['plants_name'],
          'amountorder': countorder,
          'total_money': countorder * detail_land[0]['plants_price'],
          'planter_id': detail_land[0]['user_id'],
          'customer_id': widget.datauser[0]['user_id'],
          'province': detail_land[0]['province'],
        });
        String savedata = jsonEncode(addtocart);
        prefs.setString('cart', savedata);
      } else {
        int convert_price = detail_land[0]['plants_price'][selectorder].toInt();
        addtocart.add({
          'pic_name':
              "http://$url/${detail_land[0]['pic_name'][0]['pic_name']}",
          'land_id': detail_land[0]['land_id'],
          'land_area': detail_land[0]['land_area'],
          'land_unit': detail_land[0]['land_unit'],
          'plants_name': detail_land[0]['plants_name'][selectorder],
          'amountorder': countorder,
          'total_money': countorder * convert_price,
          'planter_id': detail_land[0]['user_id'],
          'customer_id': widget.datauser[0]['user_id'],
          'province': detail_land[0]['province'],
        });
        String savedata = jsonEncode(addtocart);
        prefs.setString('cart', savedata);
      }
    } else {
      List addtocart = [];
      String? rawdataincart = prefs.getString('cart');
      List dataincart = jsonDecode(rawdataincart!);
      // print(dataincart[0]);
      // print(dataincart.runtimeType);
      if (detail_land[0]['plants_price'] is int) {
        List dummydata = [];
        for (int i = 0; i < dataincart.length; i++) {
          dummydata.add(dataincart[i]);
        }
        dummydata.add({
          'pic_name':
              "http://$url/${detail_land[0]['pic_name'][0]['pic_name']}",
          'land_id': detail_land[0]['land_id'],
          'land_area': detail_land[0]['land_area'],
          'land_unit': detail_land[0]['land_unit'],
          'plants_name': detail_land[0]['plants_name'],
          'amountorder': countorder,
          'total_money': countorder * detail_land[0]['plants_price'],
          'planter_id': detail_land[0]['user_id'],
          'customer_id': widget.datauser[0]['user_id'],
          'province': detail_land[0]['province'],
        });
        // print(dummydata);
        String savedata = jsonEncode(dummydata);
        prefs.setString('cart', savedata);
      } else {
        int convert_price = detail_land[0]['plants_price'][selectorder].toInt();
        List dummydata = [];
        for (int i = 0; i < dataincart.length; i++) {
          dummydata.add(dataincart[i]);
        }
        dummydata.add({
          'pic_name':
              "http://$url/${detail_land[0]['pic_name'][0]['pic_name']}",
          'land_id': detail_land[0]['land_id'],
          'land_area': detail_land[0]['land_area'],
          'land_unit': detail_land[0]['land_unit'],
          'plants_name': detail_land[0]['plants_name'][selectorder],
          'amountorder': countorder,
          'total_money': countorder * convert_price,
          'planter_id': detail_land[0]['user_id'],
          'customer_id': widget.datauser[0]['user_id'],
          'province': detail_land[0]['province'],
        });
        // print(dummydata);
        String savedata = jsonEncode(dummydata);
        prefs.setString('cart', savedata);
      }
      // addtocart.add({
      //   'pic_name': "http://$url/${detail_land[0]['pic_name'][0]['pic_name']}",
      //   'land_id': detail_land[0]['land_id'],
      //   'land_area': detail_land[0]['land_area'],
      //   'land_unit': detail_land[0]['land_unit'],
      //   'amountorder': countorder,
      //   'total_money':
      //       countorder * int.parse(detail_land[0]['plants_price'][selectorder]),
      //   'planter_id': detail_land[0]['user_id'],
      //   'customer_id': widget.datauser[0]['user_id'],
      //   'province': detail_land[0]['province'],
      // });
    }

    Navigator.pop(context);
  }

  int checkspawnoder() {
    if (detail_land[0]['plants_name'] is String) {
      return 1;
    } else {
      return detail_land[0]['plants_name'].length;
    }
  }

  String checkStringorder(index) {
    if (detail_land[0]['plants_name'] is String) {
      return '${detail_land[0]['plants_name']} ${detail_land[0]['plants_price']} Baht/Kg';
    } else {
      return '${detail_land[0]['plants_name'][index]} ${detail_land[0]['plants_price'][index]} Baht/Kg';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    if (widget.datauser[0]['identify'] == 1) {
      disable_orderBottom = true;
    }
    infoland();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return build_check
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Cart');
                  },
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        main_picture,
                        width: size.width,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${detail_land[0]['province']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Land: ${detail_land[0]['land_area']} ${detail_land[0]['land_unit']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        detail_land[0]['rating'] == 0
                            ? Column(
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  Text('${detail_land[0]['rating']} rate'),
                                ],
                              )
                            : Column(
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    color: Colors.amber,
                                    size: 35,
                                  ),
                                  Text('${detail_land[0]['rating']} rate'),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '${detail_land[0]['land_description']}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.3, color: Colors.grey),
                          bottom: BorderSide(width: 0.3, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              margin: EdgeInsets.only(
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 27,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${detail_land[0]['name']}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Planted: ${detail_land[0]['planted']}',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                    ),
                    child: Text(
                      'Photos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: detail_land[0]['pic_name'].length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      main_picture =
                                          "http://$url/${detail_land[0]['pic_name'][index]['pic_name']}";
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: Image.network(
                                        "http://$url/${detail_land[0]['pic_name'][index]['pic_name']}",
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.all(0),
                    onPressed: fav
                        ? () async {
                            try {
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
                                          child: CircularProgressIndicator(),
                                        ));
                                  });
                              Uri uri_defav = Uri.http(url, "/defavland");
                              http.Response responseAddfav =
                                  await http.post(uri_defav, body: {
                                "user_id":
                                    widget.datauser[0]['user_id'].toString(),
                                'land_id': detail_land[0]['land_id'].toString(),
                                "check_role": "user"
                              });
                              if (responseAddfav.statusCode == 200) {
                                Navigator.pop(context);
                                setState(() {
                                  fav = false;
                                });
                              } else {
                                Navigator.pop(context);
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        title: Icon(
                                          Icons.error_outline_outlined,
                                          color: Colors.red.shade400,
                                          size: 70,
                                        ),
                                        content: Text(
                                          '${responseAddfav.body}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              style: ButtonStyle(
                                                  alignment: Alignment.center,
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          side: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300)))),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                                print(responseAddfav.statusCode);
                                print(responseAddfav.body);
                              }
                            } catch (e) {
                              Navigator.pop(context);
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      title: Icon(
                                        Icons.error_outline_outlined,
                                        color: Colors.red.shade400,
                                        size: 70,
                                      ),
                                      content: Text(
                                        'Connection error',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        side: BorderSide(
                                                            color: Colors.grey
                                                                .shade300)))),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                              print(e);
                              print("connection error");
                            }
                          }
                        : () async {
                            // print(widget.datauser[0]);
                            // print(detail_land[0]);
                            try {
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
                                          child: CircularProgressIndicator(),
                                        ));
                                  });
                              Uri uri_fav = Uri.http(url, "/addfavland");
                              http.Response responseAddfav =
                                  await http.post(uri_fav, body: {
                                "user_id":
                                    widget.datauser[0]['user_id'].toString(),
                                'land_id': detail_land[0]['land_id'].toString(),
                                "check_role": "user"
                              });
                              if (responseAddfav.statusCode == 200) {
                                Navigator.pop(context);
                                setState(() {
                                  fav = true;
                                });
                              } else {
                                Navigator.pop(context);
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)),
                                        ),
                                        title: Icon(
                                          Icons.error_outline_outlined,
                                          color: Colors.red.shade400,
                                          size: 70,
                                        ),
                                        content: Text(
                                          '${responseAddfav.body}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        actions: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              style: ButtonStyle(
                                                  alignment: Alignment.center,
                                                  shape: MaterialStateProperty
                                                      .all(RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          side: BorderSide(
                                                              color: Colors.grey
                                                                  .shade300)))),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                                print(responseAddfav.statusCode);
                                print(responseAddfav.body);
                              }
                            } catch (e) {
                              Navigator.pop(context);
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (BuildContext) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      title: Icon(
                                        Icons.error_outline_outlined,
                                        color: Colors.red.shade400,
                                        size: 70,
                                      ),
                                      content: Text(
                                        'Connection error',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      actions: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                                shape: MaterialStateProperty
                                                    .all(RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        side: BorderSide(
                                                            color: Colors.grey
                                                                .shade300)))),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                              print(e);
                              print("connection error");
                            }
                          },
                    icon: fav
                        ? Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              //color: gbase,
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.favorite_rounded,
                              color: Colors.red,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.favorite_border_outlined),
                          ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      primary: gbase,
                      minimumSize: Size(270, 50),
                    ),
                    onPressed: disable_orderBottom
                        ? () {
                            setState(() {
                              showModalBottomSheet<void>(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(13.0))),
                                context: context,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                    builder: (BuildContext context,
                                        StateSetter setState) {
                                      return Container(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  icon: Icon(Icons.close),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              height: 210,
                                              child: GridView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  shrinkWrap: true,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    // mainAxisExtent: 28,
                                                    crossAxisCount: 2,
                                                    childAspectRatio:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            (MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height /
                                                                7),
                                                  ),
                                                  itemCount: checkspawnoder(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return Container(
                                                      //  margin: EdgeInsets.symmetric(vertical: 15),
                                                      margin: EdgeInsets.all(8),
                                                      //height: 10,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 1,
                                                            color:
                                                                selectorder ==
                                                                        index
                                                                    ? gbase
                                                                    : Colors
                                                                        .grey),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            selectorder = index;
                                                          });
                                                        },
                                                        child: Text(
                                                          checkStringorder(
                                                              index),
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            color:
                                                                selectorder ==
                                                                        index
                                                                    ? gbase
                                                                    : Colors
                                                                        .black,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            const Divider(
                                              height: 50,
                                              thickness: 1,
                                            ),
                                            Container(
                                              // decoration: BoxDecoration(color: Colors.red),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Amount',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          onPressed: () {
                                                            setState(() {
                                                              if (countorder >
                                                                  1) {
                                                                countorder--;
                                                              }
                                                            });
                                                          },
                                                          icon: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 2,
                                                              horizontal: 7,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Text('-'),
                                                          ),
                                                        ),
                                                        Text('$countorder'),
                                                        IconButton(
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          onPressed: () {
                                                            setState(() {
                                                              countorder++;
                                                            });
                                                          },
                                                          icon: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              vertical: 2,
                                                              horizontal: 7,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border.all(
                                                                  width: 1,
                                                                  color: Colors
                                                                      .grey),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            child: Text('+'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10),
                                                  ),
                                                  primary: gbase,
                                                  minimumSize:
                                                      Size(double.infinity, 50),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    adddatacart();
                                                  });
                                                },
                                                child: Text(
                                                  'Add to cart',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                              // showBotton_sheet = true;
                            });
                          }
                        : null,
                    child: Text(
                      'Order',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // bottomSheet: showBotton_sheet
            //     ?
            //     : null,
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
