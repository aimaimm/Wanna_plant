import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wanna_plant/constants.dart';
import 'package:http/http.dart' as http;
import 'package:wanna_plant/homepage/DetailLand/DetailScreen.dart';
import 'package:wanna_plant/homepage/homepage_seeAllScrenn.dart';

import '../CustomBottomBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hide_pop = true;
  double animation_search = 1;
  bool show_items_count = false;
  List Listplant = [
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
      'Description': 'Please wait for 50 day after plant',
      'Owner': 'John John',
      'Planted': '2 items',
    },
  ];

  void animationFade_search(context) {
    if (hide_pop) {
      Timer(
        Duration(milliseconds: 300),
        () {
          setState(
            () {
              show_items_count = true;
              hide_pop = false;
            },
          );
        },
      );
    }
  }

  Future<void> test() async {
    Uri uri_login = Uri.http(url, '/allland');
    // TODO: implement initState
    try {
      http.Response respons = await http.get(uri_login);
      if (respons.statusCode == 200) {
        print(respons.body);
        print(respons.body.runtimeType);
      }
    } catch (e) {
      print(e);
      print('connection error');
    }
  }

  @override
  void initState() {
    test();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (hide_pop == false) {
      if (currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
        setState(() {
          hide_pop = true;
          show_items_count = false;
          animation_search = 1;
        });
      }
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 170,
          titleSpacing: 0,
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(top: 35, right: 30, left: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Will you have',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Text(
                          'Wanna plant?',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, '/Tracking_planter');
                              },
                              icon: Icon(
                                Icons.notifications,
                                color: Colors.grey[350],
                                size: 35,
                              ),
                            ),
                            Positioned(
                              right: 8,
                              top: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                width: 10,
                                height: 10,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.pushNamed(context, '/Cart');
                          },
                          icon: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
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
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          animation_search = 0;
                          animationFade_search(context);
                        });
                      },
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xffF0F0F0),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        hintText: 'Search',
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [],
                    ),
                    AnimatedOpacity(
                      opacity: animation_search,
                      duration: const Duration(milliseconds: 300),
                      child: Visibility(
                        visible: hide_pop,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                'Popular proeperty',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Listplant.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            // print(index);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreen(
                                                  listplant: Listplant[index],
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Color(0XFFF9F9F9),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Padding(
                                              padding: const EdgeInsets.all(16),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    child: Image.asset(
                                                      '${Listplant[index]['picture']}',
                                                      width: 150,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${Listplant[index]['localtion']}',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                          Text(
                                                            '${Listplant[index]['land']}',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                          Text(
                                                            '${Listplant[index]['plant']}',
                                                            style: TextStyle(
                                                                fontSize: 10),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 40,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Icon(
                                                            Icons.star_rate,
                                                            color: Colors.amber,
                                                            size: 20,
                                                          ),
                                                          Text(
                                                            '4.7 rate',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: show_items_count,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('${Listplant.length.toString()} Items'),
                    ],
                  ),
                ),
                Visibility(
                  visible: hide_pop,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Seeallscreen(),
                            ),
                          );
                        },
                        child: Text(
                          'see all',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Listplant.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (hide_pop == false) {
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                            setState(() {
                              hide_pop = true;
                              show_items_count = false;
                              animation_search = 1;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  listplant: Listplant[index],
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  listplant: Listplant[index],
                                ),
                              ),
                            );
                          }
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                listplant: Listplant[index],
                              ),
                            ),
                          );
                        }
                      },
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
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(18),
                                child: Image.asset(
                                  '${Listplant[index]['picture']}',
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${Listplant[index]['localtion']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Land: ${Listplant[index]['land']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '${Listplant[index]['plant']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.star_rate,
                                      color: Colors.amber,
                                      size: 25,
                                    ),
                                    Text(
                                      '4.7 rate',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
