import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:wanna_plant/constants.dart';
// ignore: unused_import
//import 'package:timelines/timelines.dart';

class TrackCustomer extends StatefulWidget {
  const TrackCustomer({Key? key, required this.userdata}) : super(key: key);

  final List userdata;

  @override
  State<StatefulWidget> createState() => _TrackCustomer();
}

class _TrackCustomer extends State<TrackCustomer> {
  int currentStep = 0;
  bool buildui = false;
  bool loadornull = false;
  bool loadsavetracking = false;
  List? data;
  List dataname = [];
  var items = [];

  void filterSearchResults(query) {
    List dummySearchList = [];
    dummySearchList.addAll(data!);
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = [];
      dummySearchList.forEach((item) {
        if ((item['activity_id'].toString().toLowerCase())
                .contains(query.toLowerCase()) ||
            (item['rating'].toString().toLowerCase())
                .contains(query.toLowerCase()) ||
            (item['datetime'].toLowerCase()).contains(query.toLowerCase()) ||
            (item['plants_name'].toLowerCase()).contains(query.toLowerCase()) ||
            (item['total_price'].toString().toLowerCase())
                .contains(query.toLowerCase()) ||
            (item['name'].toString().toLowerCase())
                .contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });

      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(data!);
      });
    }
  }

  Future showsavetracking() async {
    await showDialog(
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
  }

  Widget spawnorder(index) {
    if (items[index]['customer'] == widget.userdata[0]['user_id']) {
      if (items[index]['tracking'] == 0) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${items[index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${items[index]['datetime']}',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff848484))),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                          height: 90,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(16)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.inventory_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Order Confirmed'),
                                  ],
                                ),
                                Row(
                                  //alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(padding: EdgeInsets.all(12)),
                                    SizedBox(width: 45),
                                    Text(
                                      'Processing....',
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.amber,
                            ),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Prepare to plant'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              color: Colors.grey,
                              // indicator: Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 2,
                              //       color: Colors.grey,
                              //       style: BorderStyle.solid,
                              //     ),
                              //     color: Colors.transparent,
                              //     shape: BoxShape.circle
                              //   ),
                              // )
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.emoji_people_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Planting'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.grass_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Harvest'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.airport_shuttle_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Delivery'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.sentiment_very_satisfied_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Success'),
                                  ],
                                ),
                              ],
                            ),
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        child: RatingBar.builder(
                            itemSize: 30,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star_outlined,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${items[index]['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.account_circle_outlined,
                              color: Color(0xff606060), size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
          ),
        );
      } else if (items[index]['tracking'] == 1) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${items[index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${items[index]['datetime']}',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff848484))),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                          height: 90,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(16)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.inventory_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Order Confirmed'),
                                  ],
                                ),
                              ],
                            ),
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.green,
                            ),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Prepare to plant'),
                                  ],
                                ),
                                Row(
                                  //alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(padding: EdgeInsets.all(12)),
                                    SizedBox(width: 45),
                                    Text(
                                      'Processing....',
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              color: Colors.amber,
                              // indicator: Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 2,
                              //       color: Colors.grey,
                              //       style: BorderStyle.solid,
                              //     ),
                              //     color: Colors.transparent,
                              //     shape: BoxShape.circle
                              //   ),
                              // )
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.emoji_people_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Planting'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.grass_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Harvest'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.airport_shuttle_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Delivery'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.sentiment_very_satisfied_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Success'),
                                  ],
                                ),
                              ],
                            ),
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        child: RatingBar.builder(
                            itemSize: 30,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star_outlined,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${items[index]['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.account_circle_outlined,
                              color: Color(0xff606060), size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
          ),
        );
      } else if (items[index]['tracking'] == 2) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${items[index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${items[index]['datetime']}',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff848484))),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                          height: 90,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(16)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.inventory_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Order Confirmed'),
                                  ],
                                ),
                              ],
                            ),
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.green,
                            ),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Prepare to plant'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              color: Colors.green,
                              // indicator: Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 2,
                              //       color: Colors.grey,
                              //       style: BorderStyle.solid,
                              //     ),
                              //     color: Colors.transparent,
                              //     shape: BoxShape.circle
                              //   ),
                              // )
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.emoji_people_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Planting'),
                                  ],
                                ),
                                Row(
                                  //alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(padding: EdgeInsets.all(12)),
                                    SizedBox(width: 45),
                                    Text(
                                      'Processing....',
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.amber,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.grass_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Harvest'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.airport_shuttle_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Delivery'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.sentiment_very_satisfied_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Success'),
                                  ],
                                ),
                              ],
                            ),
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        child: RatingBar.builder(
                            itemSize: 30,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star_outlined,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${items[index]['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.account_circle_outlined,
                              color: Color(0xff606060), size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
          ),
        );
      } else if (items[index]['tracking'] == 3) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${items[index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${items[index]['datetime']}',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff848484))),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                          height: 90,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(16)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.inventory_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Order Confirmed'),
                                  ],
                                ),
                              ],
                            ),
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.red,
                            ),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Prepare to plant'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              color: Colors.green,
                              // indicator: Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 2,
                              //       color: Colors.grey,
                              //       style: BorderStyle.solid,
                              //     ),
                              //     color: Colors.transparent,
                              //     shape: BoxShape.circle
                              //   ),
                              // )
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.emoji_people_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Planting'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.green,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.grass_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Harvest'),
                                  ],
                                ),
                                Row(
                                  //alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(padding: EdgeInsets.all(12)),
                                    SizedBox(width: 45),
                                    Text(
                                      'Processing....',
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.amber,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.airport_shuttle_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Delivery'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.sentiment_very_satisfied_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Success'),
                                  ],
                                ),
                              ],
                            ),
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        child: RatingBar.builder(
                            itemSize: 30,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star_outlined,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${items[index]['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.account_circle_outlined,
                              color: Color(0xff606060), size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
          ),
        );
      } else if (items[index]['tracking'] == 4) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${items[index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${items[index]['datetime']}',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff848484))),
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                          height: 90,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(16)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.inventory_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Order Confirmed'),
                                  ],
                                ),
                              ],
                            ),
                            isFirst: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.green,
                            ),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.timer_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Prepare to plant'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              color: Colors.green,
                              // indicator: Container(
                              //   decoration: BoxDecoration(
                              //     border: Border.all(
                              //       width: 2,
                              //       color: Colors.grey,
                              //       style: BorderStyle.solid,
                              //     ),
                              //     color: Colors.transparent,
                              //     shape: BoxShape.circle
                              //   ),
                              // )
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.emoji_people_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Planting'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.green,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.grass_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Harvest'),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.green,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.airport_shuttle_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Delivery'),
                                  ],
                                ),
                                Row(
                                  //alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(padding: EdgeInsets.all(12)),
                                    SizedBox(width: 45),
                                    Text(
                                      'Processing....',
                                      style: TextStyle(
                                          color: Colors.amber, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.amber,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                      SizedBox(
                          height: 80,
                          child: TimelineTile(
                            endChild: Column(
                              children: [
                                Padding(padding: EdgeInsets.all(10)),
                                Row(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(8)),
                                    Icon(
                                      Icons.sentiment_very_satisfied_outlined,
                                      size: 33,
                                      color: Color(0xff757575),
                                    ),
                                    SizedBox(width: 20),
                                    Text('Success'),
                                  ],
                                ),
                              ],
                            ),
                            isLast: true,
                            indicatorStyle: IndicatorStyle(
                              //indicator: ,
                              color: Colors.grey,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.grey, thickness: 2),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                const Divider(
                  height: 0,
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                Container(
                  padding: EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: false,
                        child: RatingBar.builder(
                            itemSize: 30,
                            initialRating: 0,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                                  Icons.star_outlined,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${items[index]['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.account_circle_outlined,
                              color: Color(0xff606060), size: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            color: Color(0xFFF3F3F3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
          ),
        );
      } else {
        return items[index]['rating'] == 0
            ? Container(
                width: 430,
                height: 650,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: ListTile(
                          title: Text(
                            '#${items[index]['activity_id']}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          trailing: Text('${items[index]['datetime']}',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff848484))),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 1,
                        endIndent: 1,
                      ),
                      Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Padding(padding: EdgeInsets.all(10)),
                            SizedBox(
                                height: 80,
                                child: TimelineTile(
                                  endChild: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(8)),
                                          Icon(
                                            Icons.inventory_outlined,
                                            size: 33,
                                            color: Color(0xff757575),
                                          ),
                                          SizedBox(width: 20),
                                          Text('Order Confirmed'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  isFirst: true,
                                  indicatorStyle: IndicatorStyle(
                                    //indicator: ,
                                    color: Color(0xff7CC671),
                                  ),
                                  afterLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                )),
                            SizedBox(
                                height: 80,
                                child: TimelineTile(
                                  endChild: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(8)),
                                          Icon(
                                            Icons.timer_outlined,
                                            size: 33,
                                            color: Color(0xff757575),
                                          ),
                                          SizedBox(width: 20),
                                          Text('Prepare to plant'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  indicatorStyle: IndicatorStyle(
                                    //indicator: ,
                                    color: Color(0xff7CC671),
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                  afterLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                )),
                            SizedBox(
                                height: 80,
                                child: TimelineTile(
                                  endChild: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(8)),
                                          Icon(
                                            Icons.emoji_people_outlined,
                                            size: 33,
                                            color: Color(0xff757575),
                                          ),
                                          SizedBox(width: 20),
                                          Text('Planting'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  indicatorStyle: IndicatorStyle(
                                    //indicator: ,
                                    color: Color(0xff7CC671),
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                  afterLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                )),
                            SizedBox(
                                height: 80,
                                child: TimelineTile(
                                  endChild: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(8)),
                                          Icon(
                                            Icons.grass_outlined,
                                            size: 33,
                                            color: Color(0xff757575),
                                          ),
                                          SizedBox(width: 20),
                                          Text('Harvest'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  indicatorStyle: IndicatorStyle(
                                    //indicator: ,
                                    color: Color(0xff7CC671),
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                  afterLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                )),
                            SizedBox(
                                height: 80,
                                child: TimelineTile(
                                  endChild: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(8)),
                                          Icon(
                                            Icons.airport_shuttle_outlined,
                                            size: 33,
                                            color: Color(0xff757575),
                                          ),
                                          SizedBox(width: 20),
                                          Text('Delivery'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  indicatorStyle: IndicatorStyle(
                                    //indicator: ,
                                    color: Color(0xff7CC671),
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                  afterLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                )),
                            SizedBox(
                                height: 80,
                                child: TimelineTile(
                                  endChild: Column(
                                    children: [
                                      Padding(padding: EdgeInsets.all(10)),
                                      Row(
                                        children: <Widget>[
                                          Padding(padding: EdgeInsets.all(8)),
                                          Icon(
                                            Icons
                                                .sentiment_very_satisfied_outlined,
                                            size: 33,
                                            color: Color(0xff757575),
                                          ),
                                          SizedBox(width: 20),
                                          Text('Success'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  isLast: true,
                                  indicatorStyle: IndicatorStyle(
                                    //indicator: ,
                                    color: Color(0xff7CC671),
                                  ),
                                  beforeLineStyle: LineStyle(
                                      color: Color(0xff7CC671), thickness: 2),
                                  //afterLineStyle: LineStyle(color: Colors.grey,thickness: 2),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      const Divider(
                        height: 0,
                        thickness: 1,
                        indent: 1,
                        endIndent: 1,
                      ),
                      Container(
                        padding: EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RatingBar.builder(
                                itemSize: 30,
                                initialRating: 0,
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => Icon(
                                      Icons.star_outlined,
                                      color: Colors.orange,
                                    ),
                                onRatingUpdate: (rating) async {
                                  // print(rating);
                                  Uri uri_rating =
                                      Uri.http(url, "/updaterating");
                                  try {
                                    http.Response response_rating =
                                        await http.post(uri_rating, body: {
                                      'activity_id': data![index]['activity_id']
                                          .toString(),
                                      'rating': rating.toString(),
                                      'check_role': "user",
                                    });
                                    if (response_rating.statusCode == 200) {
                                      setState(() {
                                        data![index]['rating'] = rating;
                                      });
                                    } else {
                                      print(response_rating.body);
                                      print(response_rating.statusCode);
                                    }
                                  } catch (e) {
                                    print(e);
                                    print("connection error");
                                  }
                                }),
                            SizedBox(width: 100),
                            Text(
                              '${items[index]['name']}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.account_circle_outlined,
                                color: Color(0xff606060), size: 30),
                          ],
                        ),
                      ),
                    ],
                  ),
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  elevation: 0,
                ),
              )
            : Container();
      }
    } else if (items[index]['planter'] == widget.userdata[0]['user_id']) {
      return Container(
        width: 430,
        height: 650,
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text(
                    '#${items[index]['activity_id']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  trailing: Text('${items[index]['datetime']}',
                      style: TextStyle(fontSize: 12, color: Color(0xff848484))),
                ),
              ),
              const Divider(
                color: Color(0xffE0E0E0),
                height: 0,
                thickness: 1,
                indent: 1,
                endIndent: 1,
              ),
              Container(
                child: Stepper(
                  controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                    return Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            onPressed: onStepContinue,
                            child: Container(
                              width: 120,
                              alignment: Alignment.center,
                              child: Text('Confirm'),
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Color(0xffFFB443),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: onStepCancel,
                            child: Container(
                              width: 120,
                              alignment: Alignment.center,
                              child: Text('Cancel'),
                            ),
                            style: TextButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  type: StepperType.vertical,
                  currentStep: items[index]['tracking'],
                  // onStepTapped: (int Step) {
                  //   setState(() {
                  //     data![index]['tracking'] = Step;
                  //   });
                  // },
                  onStepContinue: () async {
                    // data![index]['tracking'] < 5 ?
                    //     ? data![index]['tracking'] += 1
                    //     : null;
                    showsavetracking();
                    Uri uri_updatetracking = Uri.http(url, "/updatetracking");
                    // print(data![index]['tracking']);
                    try {
                      http.Response response_tracking =
                          await http.post(uri_updatetracking, body: {
                        'activity_id': items[index]['activity_id'].toString(),
                        'tracking': (items[index]['tracking'] + 1).toString(),
                        'check_role': "user",
                      });

                      if (response_tracking.statusCode == 200) {
                        setState(() {
                          loadsavetracking = true;
                          loaddata();
                        });
                      } else {
                        items[index]['tracking']--;
                        print(response_tracking.body);
                        print(response_tracking.statusCode);
                      }
                    } catch (e) {
                      print(e);
                      print("connection error");
                    }
                  },
                  onStepCancel: () async {
                    showsavetracking();
                    Uri uri_cancelorder = Uri.http(url, "/cancelordertracking");
                    // print(data![index]['tracking']);
                    try {
                      http.Response response_canceltracking =
                          await http.post(uri_cancelorder, body: {
                        'activity_id': items[index]['activity_id'].toString(),
                        'check_role': "user",
                      });

                      if (response_canceltracking.statusCode == 200) {
                        setState(() {
                          loadsavetracking = true;
                          loaddata();
                        });
                      } else {
                        items[index]['tracking']--;
                        print(response_canceltracking.body);
                        print(response_canceltracking.statusCode);
                      }
                    } catch (e) {
                      print(e);
                      print("connection error");
                    }
                  },
                  //Step Tracking 1- 6
                  steps: [
                    Step(
                        isActive: items[index]['tracking'] >= 0,
                        state: items[index]['tracking'] == 0
                            ? StepState.editing
                            : StepState.complete,
                        title: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.inventory_outlined,
                                size: 33,
                                color: Color(0xff757575),
                              ),
                              Padding(padding: EdgeInsets.all(12)),
                              Text(
                                'Order Confirmed',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        content: Text('')),
                    Step(
                        isActive: items[index]['tracking'] >= 1,
                        state: items[index]['tracking'] == 1
                            ? StepState.editing
                            : items[index]['tracking'] < 1
                                ? StepState.disabled
                                : StepState.complete,
                        title: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.timer_outlined,
                                size: 33,
                                color: Color(0xff757575),
                              ),
                              Padding(padding: EdgeInsets.all(12)),
                              Text(
                                'Prepare to plant',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        content: Text('')),
                    Step(
                        isActive: items[index]['tracking'] >= 2,
                        state: items[index]['tracking'] == 2
                            ? StepState.editing
                            : items[index]['tracking'] < 2
                                ? StepState.disabled
                                : StepState.complete,
                        title: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.emoji_people_outlined,
                                size: 33,
                                color: Color(0xff757575),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Planting',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        content: Text('')),
                    Step(
                        isActive: items[index]['tracking'] >= 3,
                        state: items[index]['tracking'] == 3
                            ? StepState.editing
                            : items[index]['tracking'] < 3
                                ? StepState.disabled
                                : StepState.complete,
                        title: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.grass_outlined,
                                size: 33,
                                color: Color(0xff757575),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Harvest',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        content: Text('')),
                    Step(
                        isActive: items[index]['tracking'] >= 4,
                        state: items[index]['tracking'] == 4
                            ? StepState.editing
                            : items[index]['tracking'] < 4
                                ? StepState.disabled
                                : StepState.complete,
                        title: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.airport_shuttle_outlined,
                                size: 33,
                                color: Color(0xff757575),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Delivery',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        content: Text('')),
                    Step(
                        isActive: items[index]['tracking'] >= 5,
                        state: items[index]['tracking'] == 5
                            ? StepState.editing
                            : items[index]['tracking'] < 5
                                ? StepState.disabled
                                : StepState.complete,
                        title: Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                Icons.sentiment_very_satisfied_outlined,
                                size: 33,
                                color: Color(0xff757575),
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              Text(
                                'Success',
                                style: (TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        content: Text('')),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffE0E0E0),
                height: 0,
                thickness: 1,
                indent: 1,
                endIndent: 1,
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '${items[index]['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.account_circle_outlined,
                      color: Color(0xff606060),
                      size: 30,
                    ),
                  ],
                ),
              )
            ],
          ),
          color: Color(0xFFF3F3F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> loaddata() async {
    dataname.clear();
    items.clear();
    Uri uri = Uri.http(url, "/tracking");
    Uri uri_dataname = Uri.http(url, "/getnameuser");
    // print(widget.userdata);
    try {
      http.Response response = await http.post(uri, body: {
        "user_id": widget.userdata[0]['user_id'].toString(),
        "check_role": "user"
      });

      if (response.statusCode == 200) {
        // print(response.body);
        data = jsonDecode(response.body);
        for (int i = 0; i < data!.length; i++) {
          if (data![i]['customer'] == widget.userdata[0]['user_id']) {
            http.Response response_name = await http.post(uri_dataname, body: {
              'user_id': data![i]['planter'].toString(),
              'check_role': "user"
            });
            if (response_name.statusCode != 200) {
              print(response.body);
              print(response.statusCode);
              break;
            } else {
              List nameuser = jsonDecode(response_name.body);
              dataname.add(nameuser[0]);
            }
          } else {
            http.Response response_name = await http.post(uri_dataname, body: {
              'user_id': data![i]['customer'].toString(),
              'check_role': "user"
            });
            if (response_name.statusCode != 200) {
              print(response.body);
              print(response.statusCode);
              break;
            } else {
              List nameuser = jsonDecode(response_name.body);
              dataname.add(nameuser[0]);
            }
          }
        }

        if (data!.length != 0) {
          // print(dataname);
          for (int i = 0; i < data!.length; i++) {
            data![i].addAll(dataname[i]);
          }
          // print(data!);
          items.addAll(data!);
          setState(() {
            if (loadsavetracking == true) {
              Navigator.pop(context);
              loadsavetracking = false;
            }
            buildui = true;
          });
        } else {
          if (loadsavetracking == true) {
            Navigator.pop(context);
            loadsavetracking = false;
          }
          setState(() {
            loadornull = true;
          });
        }
      } else {
        print(response.body);
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("connection error");
    }
  }

  @override
  void initState() {
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tracking',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.grey[300]),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: loaddata,
        child: buildui
            ? Center(
                child: Column(
                  children: <Widget>[
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
                        width: 400,
                        child: TextField(
                          onChanged: (value) => {
                            filterSearchResults(value.toString()),
                          },
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF3F3F3),
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            // labelText: 'Search',
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 420,
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return spawnorder(index);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : loadornull
                ? Center(
                    child: Container(
                      child: Text("No order tracking"),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
      ),
    );
  }
}
