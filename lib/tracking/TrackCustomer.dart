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
    if (data![index]['customer'] == widget.userdata[0]['user_id']) {
      if (data![index]['tracking'] == 0) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${data![index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${data![index]['datetime']}',
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
                              print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${dataname[index]['name']}',
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
      } else if (data![index]['tracking'] == 1) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${data![index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${data![index]['datetime']}',
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
                              print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${dataname[index]['name']}',
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
      } else if (data![index]['tracking'] == 2) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${data![index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${data![index]['datetime']}',
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
                              print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${dataname[index]['name']}',
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
      } else if (data![index]['tracking'] == 3) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${data![index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${data![index]['datetime']}',
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
                              print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${dataname[index]['name']}',
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
      } else if (data![index]['tracking'] == 4) {
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${data![index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${data![index]['datetime']}',
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
                              print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${dataname[index]['name']}',
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
        return Container(
          width: 430,
          height: 650,
          child: Card(
            child: Column(
              children: <Widget>[
                Container(
                  child: ListTile(
                    title: Text(
                      '#${data![index]['activity_id']}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    trailing: Text('${data![index]['datetime']}',
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
                              color: Colors.green,
                            ),
                            beforeLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
                            afterLineStyle:
                                LineStyle(color: Colors.green, thickness: 2),
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
                        visible: true,
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
                              print(rating);
                            }),
                      ),
                      //SizedBox(width: 100),
                      Row(
                        children: [
                          Text(
                            '${dataname[index]['name']}',
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
      }
    } else {
      return Container(
        width: 430,
        height: 650,
        child: Card(
          child: Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text(
                    '#${data![index]['activity_id']}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  trailing: Text('${data![index]['datetime']}',
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
                  currentStep: data![index]['tracking'],
                  // onStepTapped: (int Step) {
                  //   setState(() {
                  //     data![index]['tracking'] = Step;
                  //   });
                  // },
                  onStepContinue: () async {
                    // data![index]['tracking'] < 5
                    //     ? data![index]['tracking'] += 1
                    //     : null;
                    showsavetracking();
                    Uri uri_updatetracking = Uri.http(url, "/updatetracking");
                    print(data![index]['tracking']);
                    try {
                      http.Response response_tracking =
                          await http.post(uri_updatetracking, body: {
                        'activity_id': data![index]['activity_id'].toString(),
                        'tracking': data![index]['tracking'] < 5
                            ? (data![index]['tracking'] + 1).toString()
                            : 6.toString(),
                        'check_role': "user",
                      });

                      if (response_tracking.statusCode == 200) {
                        setState(() {
                          loadsavetracking = true;
                          loaddata();
                        });
                      } else {
                        data![index]['tracking']--;
                        print(response_tracking.body);
                        print(response_tracking.statusCode);
                      }
                    } catch (e) {
                      print(e);
                      print("connection error");
                    }
                  },
                  onStepCancel: () {},
                  //Step Tracking 1- 6
                  steps: [
                    Step(
                        isActive: data![index]['tracking'] >= 0,
                        state: data![index]['tracking'] == 0
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
                        isActive: data![index]['tracking'] >= 1,
                        state: data![index]['tracking'] == 1
                            ? StepState.editing
                            : data![index]['tracking'] < 1
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
                        isActive: data![index]['tracking'] >= 2,
                        state: data![index]['tracking'] == 2
                            ? StepState.editing
                            : data![index]['tracking'] < 2
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
                        isActive: data![index]['tracking'] >= 3,
                        state: data![index]['tracking'] == 3
                            ? StepState.editing
                            : data![index]['tracking'] < 3
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
                        isActive: data![index]['tracking'] >= 4,
                        state: data![index]['tracking'] == 4
                            ? StepState.editing
                            : data![index]['tracking'] < 4
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
                        isActive: data![index]['tracking'] >= 5,
                        state: data![index]['tracking'] == 5
                            ? StepState.editing
                            : data![index]['tracking'] < 5
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
                      '${dataname[index]['name']}',
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
    }
  }

  Future<void> loaddata() async {
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
          // print(data!);
          // print(dataname);
          setState(() {
            if (loadsavetracking == true) {
              Navigator.pop(context);
              loadsavetracking = false;
            }
            buildui = true;
          });
        } else {
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
                          itemCount: data!.length,
                          itemBuilder: (context, index) {
                            return

                                // Container(
                                //     width: 430,
                                //     height: 650,
                                //     child: Card(
                                //       child: Column(
                                //         children: <Widget>[
                                //           Container(
                                //             child: ListTile(
                                //               title: Text(
                                //                 '#${data![index]['activity_id']}',
                                //                 style: TextStyle(
                                //                     fontWeight: FontWeight.bold,
                                //                     fontSize: 14),
                                //               ),
                                //               trailing: Text('${data![index]['datetime']}',
                                //                   style: TextStyle(
                                //                       fontSize: 12,
                                //                       color: Color(0xff848484))),
                                //             ),
                                //           ),
                                //           const Divider(
                                //             height: 0,
                                //             thickness: 1,
                                //             indent: 1,
                                //             endIndent: 1,
                                //           ),
                                //           Container(
                                //             padding: EdgeInsets.all(14),
                                //             child: Column(
                                //               //mainAxisAlignment: MainAxisAlignment.start,
                                //               children: [
                                //                 //Padding(padding: EdgeInsets.all(10)),
                                //                 SizedBox(
                                //                     height: 90,
                                //                     child: TimelineTile(
                                //                       endChild: Column(
                                //                         children: [
                                //                           Padding(
                                //                               padding:
                                //                                   EdgeInsets.all(
                                //                                       16)),
                                //                           Row(
                                //                             children: <Widget>[
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               8)),
                                //                               Icon(
                                //                                 Icons
                                //                                     .inventory_outlined,
                                //                                 size: 33,
                                //                                 color: Color(
                                //                                     0xff757575),
                                //                               ),
                                //                               SizedBox(width: 20),
                                //                               Text(
                                //                                   'Order Confirmed'),
                                //                             ],
                                //                           ),
                                //                           Row(
                                //                             //alignment: Alignment.centerLeft,
                                //                             children: [
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               12)),
                                //                               SizedBox(width: 45),
                                //                               Text(
                                //                                 'Order cancel !!!',
                                //                                 style: TextStyle(
                                //                                     color: Colors
                                //                                         .red,
                                //                                     fontSize: 12),
                                //                               ),
                                //                             ],
                                //                           )
                                //                         ],
                                //                       ),
                                //                       isFirst: true,
                                //                       indicatorStyle:
                                //                           IndicatorStyle(
                                //                         //indicator: ,
                                //                         color: Colors.red,
                                //                       ),
                                //                       afterLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                     )),
                                //                 SizedBox(
                                //                     height: 80,
                                //                     child: TimelineTile(
                                //                       endChild: Column(
                                //                         children: [
                                //                           Padding(
                                //                               padding:
                                //                                   EdgeInsets.all(
                                //                                       10)),
                                //                           Row(
                                //                             children: <Widget>[
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               8)),
                                //                               Icon(
                                //                                 Icons
                                //                                     .timer_outlined,
                                //                                 size: 33,
                                //                                 color: Color(
                                //                                     0xff757575),
                                //                               ),
                                //                               SizedBox(width: 20),
                                //                               Text(
                                //                                   'Prepare to plant'),
                                //                             ],
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       indicatorStyle:
                                //                           IndicatorStyle(
                                //                         color: Colors.grey,
                                //                         // indicator: Container(
                                //                         //   decoration: BoxDecoration(
                                //                         //     border: Border.all(
                                //                         //       width: 2,
                                //                         //       color: Colors.grey,
                                //                         //       style: BorderStyle.solid,
                                //                         //     ),
                                //                         //     color: Colors.transparent,
                                //                         //     shape: BoxShape.circle
                                //                         //   ),
                                //                         // )
                                //                       ),
                                //                       beforeLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                       afterLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                     )),
                                //                 SizedBox(
                                //                     height: 80,
                                //                     child: TimelineTile(
                                //                       endChild: Column(
                                //                         children: [
                                //                           Padding(
                                //                               padding:
                                //                                   EdgeInsets.all(
                                //                                       10)),
                                //                           Row(
                                //                             children: <Widget>[
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               8)),
                                //                               Icon(
                                //                                 Icons
                                //                                     .emoji_people_outlined,
                                //                                 size: 33,
                                //                                 color: Color(
                                //                                     0xff757575),
                                //                               ),
                                //                               SizedBox(width: 20),
                                //                               Text('Planting'),
                                //                             ],
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       indicatorStyle:
                                //                           IndicatorStyle(
                                //                         //indicator: ,
                                //                         color: Colors.grey,
                                //                       ),
                                //                       beforeLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                       afterLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                     )),
                                //                 SizedBox(
                                //                     height: 80,
                                //                     child: TimelineTile(
                                //                       endChild: Column(
                                //                         children: [
                                //                           Padding(
                                //                               padding:
                                //                                   EdgeInsets.all(
                                //                                       10)),
                                //                           Row(
                                //                             children: <Widget>[
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               8)),
                                //                               Icon(
                                //                                 Icons
                                //                                     .grass_outlined,
                                //                                 size: 33,
                                //                                 color: Color(
                                //                                     0xff757575),
                                //                               ),
                                //                               SizedBox(width: 20),
                                //                               Text('Harvest'),
                                //                             ],
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       indicatorStyle:
                                //                           IndicatorStyle(
                                //                         //indicator: ,
                                //                         color: Colors.grey,
                                //                       ),
                                //                       beforeLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                       afterLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                     )),
                                //                 SizedBox(
                                //                     height: 80,
                                //                     child: TimelineTile(
                                //                       endChild: Column(
                                //                         children: [
                                //                           Padding(
                                //                               padding:
                                //                                   EdgeInsets.all(
                                //                                       10)),
                                //                           Row(
                                //                             children: <Widget>[
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               8)),
                                //                               Icon(
                                //                                 Icons
                                //                                     .airport_shuttle_outlined,
                                //                                 size: 33,
                                //                                 color: Color(
                                //                                     0xff757575),
                                //                               ),
                                //                               SizedBox(width: 20),
                                //                               Text('Delivery'),
                                //                             ],
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       indicatorStyle:
                                //                           IndicatorStyle(
                                //                         //indicator: ,
                                //                         color: Colors.grey,
                                //                       ),
                                //                       beforeLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                       afterLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                     )),
                                //                 SizedBox(
                                //                     height: 80,
                                //                     child: TimelineTile(
                                //                       endChild: Column(
                                //                         children: [
                                //                           Padding(
                                //                               padding:
                                //                                   EdgeInsets.all(
                                //                                       10)),
                                //                           Row(
                                //                             children: <Widget>[
                                //                               Padding(
                                //                                   padding:
                                //                                       EdgeInsets
                                //                                           .all(
                                //                                               8)),
                                //                               Icon(
                                //                                 Icons
                                //                                     .sentiment_very_satisfied_outlined,
                                //                                 size: 33,
                                //                                 color: Color(
                                //                                     0xff757575),
                                //                               ),
                                //                               SizedBox(width: 20),
                                //                               Text('Success'),
                                //                             ],
                                //                           ),
                                //                         ],
                                //                       ),
                                //                       isLast: true,
                                //                       indicatorStyle:
                                //                           IndicatorStyle(
                                //                         //indicator: ,
                                //                         color: Colors.grey,
                                //                       ),
                                //                       beforeLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                       afterLineStyle: LineStyle(
                                //                           color: Colors.grey,
                                //                           thickness: 2),
                                //                     )),
                                //               ],
                                //             ),
                                //           ),
                                //           SizedBox(height: 10),
                                //           const Divider(
                                //             height: 0,
                                //             thickness: 1,
                                //             indent: 1,
                                //             endIndent: 1,
                                //           ),
                                //           Container(
                                //             padding: EdgeInsets.all(14.0),
                                //             child: Row(
                                //               mainAxisAlignment:
                                //                   MainAxisAlignment.spaceBetween,
                                //               children: <Widget>[
                                //                 Visibility(
                                //                   visible: false,
                                //                   child: RatingBar.builder(
                                //                       itemSize: 30,
                                //                       initialRating: 0,
                                //                       minRating: 0,
                                //                       direction: Axis.horizontal,
                                //                       allowHalfRating: true,
                                //                       itemCount: 5,
                                //                       itemPadding:
                                //                           EdgeInsets.symmetric(
                                //                               horizontal: 1.0),
                                //                       itemBuilder: (context, _) =>
                                //                           Icon(
                                //                             Icons.star_outlined,
                                //                             color: Colors.orange,
                                //                           ),
                                //                       onRatingUpdate: (rating) {
                                //                         print(rating);
                                //                       }),
                                //                 ),
                                //                 //SizedBox(width: 100),
                                //                 Row(
                                //                   children: [
                                //                     Text(
                                //                       'Jan Jukoo',
                                //                       style: TextStyle(
                                //                           fontWeight:
                                //                               FontWeight.bold),
                                //                     ),
                                //                     SizedBox(width: 10),
                                //                     Icon(
                                //                         Icons
                                //                             .account_circle_outlined,
                                //                         color: Color(0xff606060),
                                //                         size: 30),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       color: Color(0xFFF3F3F3),
                                //       shape: RoundedRectangleBorder(
                                //         borderRadius: BorderRadius.circular(16.0),
                                //       ),
                                //       elevation: 0,
                                //     ),
                                //   )

                                //     Container(
                                //   width: 430,
                                //   height: 650,
                                //   child: Card(
                                //     child: Column(
                                //       children: <Widget>[
                                //         Container(
                                //           child: ListTile(
                                //             title: Text(
                                //               '#01',
                                //               style: TextStyle(
                                //                   fontWeight: FontWeight.bold,
                                //                   fontSize: 14),
                                //             ),
                                //             trailing: Text('12/09/64',
                                //                 style: TextStyle(
                                //                     fontSize: 12,
                                //                     color: Color(0xff848484))),
                                //           ),
                                //         ),
                                //         const Divider(
                                //           color: Color(0xffE0E0E0),
                                //           height: 0,
                                //           thickness: 1,
                                //           indent: 1,
                                //           endIndent: 1,
                                //         ),
                                //         Container(
                                //           child: Stepper(
                                //             controlsBuilder: (context,
                                //                 {onStepCancel, onStepContinue}) {
                                //               return Center(
                                //                 child: Row(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.center,
                                //                   children: <Widget>[
                                //                     TextButton(
                                //                       onPressed: onStepContinue,
                                //                       child: Container(
                                //                         width: 120,
                                //                         alignment: Alignment.center,
                                //                         child: Text('Confirm'),
                                //                       ),
                                //                       style: TextButton.styleFrom(
                                //                         primary: Colors.black,
                                //                         backgroundColor:
                                //                             Color(0xffFFB443),
                                //                         shape: RoundedRectangleBorder(
                                //                           borderRadius:
                                //                               BorderRadius.circular(
                                //                                   10.0),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                     SizedBox(
                                //                       width: 20,
                                //                     ),
                                //                     TextButton(
                                //                       onPressed: onStepCancel,
                                //                       child: Container(
                                //                         width: 120,
                                //                         alignment: Alignment.center,
                                //                         child: Text('Cancel'),
                                //                       ),
                                //                       style: TextButton.styleFrom(
                                //                         primary: Colors.black,
                                //                         backgroundColor: Colors.white,
                                //                         shape: RoundedRectangleBorder(
                                //                           borderRadius:
                                //                               BorderRadius.circular(
                                //                                   10.0),
                                //                         ),
                                //                       ),
                                //                     ),
                                //                   ],
                                //                 ),
                                //               );
                                //             },
                                //             type: StepperType.vertical,
                                //             currentStep: currentStep,
                                //             onStepTapped: (int Step) {
                                //               setState(() {
                                //                 currentStep = Step;
                                //               });
                                //             },
                                //             onStepContinue: () {
                                //               currentStep < 5
                                //                   ? setState(() => currentStep += 1)
                                //                   : null;
                                //             },
                                //             onStepCancel: () {},
                                //             //Step Tracking 1- 6
                                //             steps: [
                                //               Step(
                                //                   isActive: currentStep >= 0,
                                //                   state: currentStep == 0
                                //                       ? StepState.editing
                                //                       : StepState.complete,
                                //                   title: Container(
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Icon(
                                //                           Icons.inventory_outlined,
                                //                           size: 33,
                                //                           color: Color(0xff757575),
                                //                         ),
                                //                         Padding(
                                //                             padding:
                                //                                 EdgeInsets.all(12)),
                                //                         Text(
                                //                           'Order Confirmed',
                                //                           style: (TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight.bold)),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                   content: Text('')),
                                //               Step(
                                //                   isActive: currentStep >= 1,
                                //                   state: currentStep == 1
                                //                       ? StepState.editing
                                //                       : currentStep < 1
                                //                           ? StepState.disabled
                                //                           : StepState.complete,
                                //                   title: Container(
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Icon(
                                //                           Icons.timer_outlined,
                                //                           size: 33,
                                //                           color: Color(0xff757575),
                                //                         ),
                                //                         Padding(
                                //                             padding:
                                //                                 EdgeInsets.all(12)),
                                //                         Text(
                                //                           'Prepare to plant',
                                //                           style: (TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight.bold)),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                   content: Text('')),
                                //               Step(
                                //                   isActive: currentStep >= 2,
                                //                   state: currentStep == 2
                                //                       ? StepState.editing
                                //                       : currentStep < 2
                                //                           ? StepState.disabled
                                //                           : StepState.complete,
                                //                   title: Container(
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Icon(
                                //                           Icons.emoji_people_outlined,
                                //                           size: 33,
                                //                           color: Color(0xff757575),
                                //                         ),
                                //                         Padding(
                                //                             padding:
                                //                                 EdgeInsets.all(10)),
                                //                         Text(
                                //                           'Planting',
                                //                           style: (TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight.bold)),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                   content: Text('')),
                                //               Step(
                                //                   isActive: currentStep >= 3,
                                //                   state: currentStep == 3
                                //                       ? StepState.editing
                                //                       : currentStep < 3
                                //                           ? StepState.disabled
                                //                           : StepState.complete,
                                //                   title: Container(
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Icon(
                                //                           Icons.grass_outlined,
                                //                           size: 33,
                                //                           color: Color(0xff757575),
                                //                         ),
                                //                         Padding(
                                //                             padding:
                                //                                 EdgeInsets.all(10)),
                                //                         Text(
                                //                           'Harvest',
                                //                           style: (TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight.bold)),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                   content: Text('')),
                                //               Step(
                                //                   isActive: currentStep >= 4,
                                //                   state: currentStep == 4
                                //                       ? StepState.editing
                                //                       : currentStep < 4
                                //                           ? StepState.disabled
                                //                           : StepState.complete,
                                //                   title: Container(
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Icon(
                                //                           Icons
                                //                               .airport_shuttle_outlined,
                                //                           size: 33,
                                //                           color: Color(0xff757575),
                                //                         ),
                                //                         Padding(
                                //                             padding:
                                //                                 EdgeInsets.all(10)),
                                //                         Text(
                                //                           'Delivery',
                                //                           style: (TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight.bold)),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                   content: Text('')),
                                //               Step(
                                //                   isActive: currentStep >= 5,
                                //                   state: currentStep == 5
                                //                       ? StepState.editing
                                //                       : currentStep < 5
                                //                           ? StepState.disabled
                                //                           : StepState.complete,
                                //                   title: Container(
                                //                     child: Row(
                                //                       crossAxisAlignment:
                                //                           CrossAxisAlignment.start,
                                //                       children: <Widget>[
                                //                         Icon(
                                //                           Icons
                                //                               .sentiment_very_satisfied_outlined,
                                //                           size: 33,
                                //                           color: Color(0xff757575),
                                //                         ),
                                //                         Padding(
                                //                             padding:
                                //                                 EdgeInsets.all(10)),
                                //                         Text(
                                //                           'Success',
                                //                           style: (TextStyle(
                                //                               fontWeight:
                                //                                   FontWeight.bold)),
                                //                         ),
                                //                       ],
                                //                     ),
                                //                   ),
                                //                   content: Text('')),
                                //             ],
                                //           ),
                                //         ),
                                //         const Divider(
                                //           color: Color(0xffE0E0E0),
                                //           height: 0,
                                //           thickness: 1,
                                //           indent: 1,
                                //           endIndent: 1,
                                //         ),
                                //         Container(
                                //           padding: EdgeInsets.all(12.0),
                                //           child: Row(
                                //             mainAxisAlignment: MainAxisAlignment.end,
                                //             children: <Widget>[
                                //               Text(
                                //                 'John John',
                                //                 style: TextStyle(
                                //                     fontWeight: FontWeight.bold),
                                //               ),
                                //               SizedBox(width: 10),
                                //               Icon(
                                //                 Icons.account_circle_outlined,
                                //                 color: Color(0xff606060),
                                //                 size: 30,
                                //               ),
                                //             ],
                                //           ),
                                //         )
                                //       ],
                                //     ),
                                //     color: Color(0xFFF3F3F3),
                                //     shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.circular(16.0),
                                //     ),
                                //     elevation: 0,
                                //   ),
                                // );
                                spawnorder(index);
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
