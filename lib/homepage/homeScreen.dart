import 'dart:async';

import 'package:flutter/material.dart';
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
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
    },
    {
      'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
      'localtion': 'Chiang Rai',
      'land': '170 accur',
      'plant': 'Carrot, tree..',
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

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Will you have',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              'Wanna plant?',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
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
                                Icon(
                                  Icons.notifications,
                                  color: Colors.grey[350],
                                  size: 35,
                                ),
                                Positioned(
                                  right: 6,
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
                              onPressed: () {},
                              icon: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.shopping_cart_outlined),
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
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Listplant.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            print(Listplant[index]);
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
                                                    children: [
                                                      Text(
                                                        '${Listplant[index]['localtion']}',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                      SizedBox(
                                                        width: 60,
                                                      ),
                                                      Icon(
                                                        Icons.star_rate,
                                                        color: Colors.amber,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    '${Listplant[index]['land']}',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                  Text(
                                                    '${Listplant[index]['plant']}',
                                                    style:
                                                        TextStyle(fontSize: 10),
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
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('All'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Seeallscreen()));
                          },
                          child: Text(
                            'see all',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Listplant.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        print(Listplant[index]);
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
                                margin: EdgeInsets.only(right: 20),
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
                                      '${Listplant[index]['land']}',
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
                                      size: 35,
                                    ),
                                    Text('4.7 rate'),
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
