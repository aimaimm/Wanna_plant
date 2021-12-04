import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanna_plant/area/regis_land_Screen.dart';
import 'package:wanna_plant/constants.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({Key? key}) : super(key: key);

  @override
  _cartScreenState createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  List? dataincart;
  bool buildui = false;

  Future showPayment() async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            title: Icon(
              Icons.check_circle_outline,
              color: Colors.lightGreen.shade400,
              size: 100,
            ),
            content: Text(
              'Payment Success',
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
  }

  Future showdeletelist(order) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            insetPadding: EdgeInsets.symmetric(vertical: 300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            title: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Are you sure you want to delete this order?',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            content: Column(
              children: [
                Divider(),
                // Image.network(
                //   '${dataincart![order]['pic_name']}',
                //   width: 150,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  padding: EdgeInsets.only(left: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${dataincart![order]['province']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        'Land: ${dataincart![order]['land_area']} ${dataincart![order]['land_unit']}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                      Text(
                        'Total: ${dataincart![order]['total_money']} baht',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(),
              ],
            ),
            actions: [
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Sure',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor: MaterialStateProperty.all(gbase),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }

  num subtotal = 0;
  num deli = 600;
  // String total = subtotal.toString();

  Future<void> loadcartdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? rawdatacart = prefs.getString('cart');
    dataincart = jsonDecode(rawdatacart!);
    setState(() {
      dataincart!.forEach((element) {
        print(element['total_money']);
        subtotal += element['total_money'];
        // print(subtotal);
      });
      buildui = true;
      // print(dataincart);
    });
  }

  @override
  void initState() {
    loadcartdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontSize: 27),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.635,
            padding: EdgeInsets.all(20),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: dataincart!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onLongPress: () {
                    showdeletelist(index);
                  },
                  child: FittedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0XFFF9F9F9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(bottom: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(18),
                              child: Image.network(
                                '${dataincart![index]['pic_name']}',
                                width: 150,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataincart![index]['province'],
                                    style: TextStyle(fontSize: 11),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Land: ',
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        "${dataincart![index]['land_area']}",
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                        ' ${dataincart![index]['land_unit']}',
                                        style: TextStyle(fontSize: 11),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Amount: ',
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      Text(
                                          ' ${dataincart![index]['amountorder']}',
                                          style: TextStyle(fontSize: 11))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Total: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        ' ${dataincart![index]['total_money']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        ' Baht ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            // width: size.width,
            height: size.height * 0.27,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                    Text(
                      '$subtotal Bath',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    ),
                    Text(
                      '$deli Bath',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${subtotal + deli} Bath',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w200),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFF7CC671),
                  ),
                  width: size.width,
                  child: TextButton(
                    onPressed: showPayment,
                    child: Text(
                      'Payment',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
