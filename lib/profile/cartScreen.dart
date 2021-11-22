import 'package:flutter/material.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({Key? key}) : super(key: key);

  @override
  _cartScreenState createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  Future showPayment() async {
    await showDialog(
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
              )
            ],
          );
        });
  }

  List<Map<dynamic, dynamic>> MycartData = [
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
    {'province': 'Chiangrai', 'land': 107, 'amount': '5', 'total': 6000},
  ];

  num subtotal = 0;
  num deli = 600;
  // String total = subtotal.toString();

  @override
  void initState() {
    MycartData.forEach((element) {
      print(element['total']);
      subtotal += element['total'];
      // print(subtotal);
    });

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
                itemCount: MycartData.length,
                itemBuilder: (context, index) {
                  return Container(
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
                              'https://images.unsplash.com/photo-1568342840184-8964c48c8b9f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=774&q=80',
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
                                  MycartData[index]['province'],
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
                                      MycartData[index]['land'].toString(),
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    Text(
                                      ' Accur',
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
                                    Text(MycartData[index]['amount'].toString(),
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
                                      MycartData[index]['total'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      ' Bath ',
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
                  );
                },
              ),
            ),
            Container(
              width: size.width,
              height: size.height * 0.27,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  )),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '$subtotal Bath',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      ),
                      Text(
                        '600 Bath',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$subtotal Bath',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w200),
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
        ));
  }
}
