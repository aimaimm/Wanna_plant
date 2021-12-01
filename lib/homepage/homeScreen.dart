import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wanna_plant/constants.dart';
import 'package:http/http.dart' as http;
import 'package:wanna_plant/data/data_planter.dart';
import 'package:wanna_plant/homepage/DetailLand/DetailScreen.dart';
import 'package:wanna_plant/homepage/homepage_seeAllScrenn.dart';

import '../CustomBottomBar.dart';

List data_land = [];

class Home extends StatefulWidget {
  const Home({Key? key, required this.userdata}) : super(key: key);

  final List userdata;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hide_pop = true;
  double animation_search = 1;
  bool show_items_count = false;

  List? rawdata_land;
  bool build_ui = false;

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

  String plant_text(datatext) {
    if (datatext is List) {
      if (datatext.length < 2) {
        return "${datatext[0]}";
      } else {
        return "${datatext[0]}, ${datatext[1]}...";
      }
    } else {
      return "$datatext";
    }
  }

  Future<void> dataland() async {
    Uri uri_login = Uri.http(url, '/allland');
    try {
      http.Response respons =
          await http.post(uri_login, body: {'user_check': "user"});

      if (respons.statusCode == 200) {
        rawdata_land = jsonDecode(respons.body);

        for (int i = 0; i < rawdata_land!.length; i++) {
          if (rawdata_land![i]['land_unit'] == "Square Centimeter") {
            rawdata_land![i]['land_unit'] = "Square CM";
          } else if (rawdata_land![i]['land_unit'] == "Square Meter") {
            rawdata_land![i]['land_unit'] = "Square M";
          } else {
            rawdata_land![i]['land_unit'] = "Square KM";
          }

          if (rawdata_land![i]['rating'] == null) {
            rawdata_land![i]['rating'] = 0;
          }

          if (rawdata_land![i]['popular_counting'] == null) {
            rawdata_land![i]['popular_counting'] = 0;
          }

          if (data_land.length == 0) {
            data_land.add(
              {
                'pic_name': "http://$url/${rawdata_land![i]['pic_name']}",
                'land_id': rawdata_land![i]['land_id'],
                'land_area': rawdata_land![i]['land_area'],
                'land_unit': rawdata_land![i]['land_unit'],
                'plants_name': rawdata_land![i]['plants_name'],
                'address': rawdata_land![i]['address'],
                'province': rawdata_land![i]['province'],
                'rating': rawdata_land![i]['rating'],
                'popular_counting': rawdata_land![i]['popular_counting'],
              },
            );
          } else if (data_land[data_land.length - 1]['land_id'] ==
              rawdata_land![i]['land_id']) {
            List stack_plant = [];

            // print(i);
            if (data_land[data_land.length - 1]['plants_name'] is List) {
              for (int p = 0;
                  p < data_land[data_land.length - 1]['plants_name'].length;
                  p++) {
                stack_plant
                    .add(data_land[data_land.length - 1]['plants_name'][p]);
              }
            } else {
              stack_plant.add(data_land[data_land.length - 1]['plants_name']);
            }
            // print(stack_plant);
            // print(data_land[data_land.length - 1]['plants_name']);
            stack_plant.add(rawdata_land![i]['plants_name']);
            // print(stack_plant);
            data_land[data_land.length - 1]['plants_name'] = stack_plant;
          } else {
            data_land.add(
              {
                'pic_name': rawdata_land![i]['pic_name'] =
                    "http://$url/${rawdata_land![i]['pic_name']}",
                'land_id': rawdata_land![i]['land_id'],
                'land_area': rawdata_land![i]['land_area'],
                'land_unit': rawdata_land![i]['land_unit'],
                'plants_name': rawdata_land![i]['plants_name'],
                'address': rawdata_land![i]['address'],
                'province': rawdata_land![i]['province'],
                'rating': rawdata_land![i]['rating'],
                'popular_counting': rawdata_land![i]['popular_counting'],
              },
            );
          }
        }

        setState(() {
          if (rawdata_land != null) {
            build_ui = true;
          }
        });
      } else {
        print("connection down");
      }
    } catch (e) {
      print(e);
      print('connection error');
    }
  }

  @override
  void initState() {
    // print(widget.userdata);
    index_bottombar = 0;
    data_land.clear();
    dataland();
    super.initState();
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
      child: build_ui
          ? Scaffold(
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
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
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
                                            itemCount: data_land.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  // print(index);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailScreen(
                                                        idland: data_land[index]
                                                            ['land_id'],
                                                        datauser:
                                                            widget.userdata,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0XFFF9F9F9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 5),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          child: Image.network(
                                                            "${data_land[index]['pic_name']}",
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
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${data_land[index]['province']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Text(
                                                                  '${data_land[index]['land_area']} ${data_land[index]['land_unit']}',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                                Text(
                                                                  plant_text(data_land[
                                                                          index]
                                                                      [
                                                                      'plants_name']),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          10),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              width: 40,
                                                            ),
                                                            data_land[index][
                                                                        'rating'] ==
                                                                    0
                                                                ? Column(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star_rate,
                                                                        color: Colors
                                                                            .grey,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        '${data_land[index]['rating']} rate',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                : Column(
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .star_rate,
                                                                        color: Colors
                                                                            .amber,
                                                                        size:
                                                                            20,
                                                                      ),
                                                                      Text(
                                                                        '${data_land[index]['rating']} rate',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              10,
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
                            Text('${data_land.length.toString()} Items'),
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
                                Navigator.pushNamed(
                                    context, "/Homepage_seeall");
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
                        itemCount: data_land.length,
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
                                        idland: data_land[index]['land_id'],
                                        datauser: widget.userdata,
                                      ),
                                    ),
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                        idland: data_land[index]['land_id'],
                                        datauser: widget.userdata,
                                      ),
                                    ),
                                  );
                                }
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      idland: data_land[index]['land_id'],
                                      datauser: widget.userdata,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: Image.network(
                                        '${data_land[index]['pic_name']}',
                                        width: 150,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data_land[index]['province']}',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Land: ${data_land[index]['land_area']} ${data_land[index]['land_unit']}',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            plant_text(data_land[index]
                                                ['plants_name']),
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    data_land[index]['rating'] == 0
                                        ? Center(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.star_rate,
                                                  color: Colors.grey,
                                                  size: 25,
                                                ),
                                                Text(
                                                  '${data_land[index]['rating']} rate',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : Center(
                                            child: Column(
                                              children: [
                                                Icon(
                                                  Icons.star_rate,
                                                  color: Colors.amber,
                                                  size: 25,
                                                ),
                                                Text(
                                                  '${data_land[index]['rating']} rate',
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
            )
          : Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
