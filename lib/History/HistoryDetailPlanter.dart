import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:wanna_plant/constants.dart';
import 'package:http/http.dart' as http;

class HistoryPlanter extends StatefulWidget {
  const HistoryPlanter({
    Key? key,
    required this.datauser,
    required this.namecustomer,
    required this.dataplanter,
  }) : super(key: key);

  final List datauser;
  final List dataplanter;
  final List namecustomer;

  @override
  State<StatefulWidget> createState() => _HistoryPlanter();
}

class _HistoryPlanter extends State<HistoryPlanter> {
  int currentStep = 0;
  String txtaddress = "";
  bool buildui = false;

  Future<void> loadaddress() async {
    Uri uri_address = Uri.http(url, "/getaddressdetailact");
    try {
      http.Response response = await http.post(uri_address, body: {
        'user_id': widget.dataplanter[0]['customer'].toString(),
        'check_role': "user",
      });
      if (response.statusCode == 200) {
        var address = jsonDecode(response.body);
        // print(address[0]['address']);
        txtaddress = address[0]['address'];
        setState(() {
          buildui = true;
        });
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
    loadaddress();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Activity',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: BackButton(
          color: Colors.grey[300],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: FittedBox(
                child: Row(
                  
                  children: [
                    Padding(padding: EdgeInsets.all(13)),
                    Container(
                      padding: EdgeInsets.all(11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          widget.dataplanter[0]['status'] == 0 &&
                                  widget.dataplanter[0]['tracking'] != 6
                              ? Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  'Success',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          Text(
                            'Number of Order #${widget.dataplanter[0]['activity_id']}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 230),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.beenhere,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              color: widget.dataplanter[0]['status'] == 0 &&
                      widget.dataplanter[0]['tracking'] != 6
                  ? Colors.redAccent
                  : Color(0xFF7CC671),
            ),
          ),
          Expanded(
            child: Container(
              width: 450,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(10)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            Container(
                              child: Icon(Icons.account_circle_outlined),
                            ),
                            Container(
                              child: Text(
                                ' ${widget.datauser[0]['name']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            Container(
                              child: Icon(Icons.grass_outlined),
                            ),
                            Container(
                              child: Text(
                                ' ${widget.dataplanter[0]['plants_name']}',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffAEAEAE),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Padding(padding: EdgeInsets.all(10)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            Container(
                              child: Icon(Icons.money_outlined),
                            ),
                            Container(
                              child: Text(
                                ' Price',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            SizedBox(width: 24),
                            Container(
                              child: Text(
                                ' ${widget.dataplanter[0]['total_price']} Baht.',
                                style: TextStyle(
                                  color: Color(0xff7D7D7D),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffAEAEAE),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Padding(padding: EdgeInsets.all(10)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            Container(
                              child: Icon(Icons.location_pin),
                            ),
                            Container(
                              child: Text(
                                ' Address for delivery',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            SizedBox(width: 24),
                            Container(
                              child: Text(
                                '$txtaddress',
                                style: TextStyle(
                                  color: Color(0xff7D7D7D),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 20,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                    color: Color(0xffAEAEAE),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.all(12)),
                            SizedBox(width: 30),
                            Container(
                              child: Text(
                                'Tracking',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: ListTile(
                              title: Text(
                                '#${widget.dataplanter[0]['activity_id']}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              trailing: Text(
                                '${widget.dataplanter[0]['datetime']}',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff848484)),
                              ),
                            ),
                          ),
                          Divider(
                            height: 0,
                            thickness: 1,
                            indent: 1,
                            endIndent: 1,
                          ),
                          Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              children: [
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
                                        widget.dataplanter[0]['status'] == 0 &&
                                                widget.dataplanter[0]
                                                        ['tracking'] ==
                                                    0
                                            ? Row(
                                                children: [
                                                  Padding(
                                                      padding:
                                                          EdgeInsets.all(12)),
                                                  SizedBox(width: 45),
                                                  Text(
                                                    'Order cancel!!',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              )
                                            : widget.dataplanter[0]
                                                        ['date_confirm'] ==
                                                    null
                                                ? Container()
                                                : Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12)),
                                                      SizedBox(width: 45),
                                                      Text(
                                                        '${widget.dataplanter[0]['date_confirm']}',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff757575),
                                                            fontSize: 12),
                                                      ),
                                                    ],
                                                  )
                                      ],
                                    ),
                                    isFirst: true,
                                    indicatorStyle:
                                        widget.dataplanter[0]['status'] == 0 &&
                                                widget.dataplanter[0]
                                                        ['tracking'] ==
                                                    0
                                            ? IndicatorStyle(
                                                //indicator: ,
                                                color: Colors.red,
                                              )
                                            : IndicatorStyle(
                                                //indicator: ,
                                                color: Colors.grey,
                                              ),
                                    afterLineStyle: LineStyle(
                                        color: Colors.grey, thickness: 2),
                                  ),
                                ),
                                SizedBox(
                                    height: 80,
                                    child: TimelineTile(
                                      endChild: Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(8)),
                                              Icon(
                                                Icons.timer_outlined,
                                                size: 33,
                                                color: Color(0xff757575),
                                              ),
                                              SizedBox(width: 20),
                                              Text('Prepare to plant'),
                                            ],
                                          ),
                                          widget.dataplanter[0]['status'] ==
                                                      0 &&
                                                  widget.dataplanter[0]
                                                          ['tracking'] ==
                                                      1
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(12)),
                                                    SizedBox(width: 45),
                                                    Text(
                                                      'Order cancel!!',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              : widget.dataplanter[0]
                                                          ['date_prepare'] ==
                                                      null
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12)),
                                                        SizedBox(width: 45),
                                                        Text(
                                                          '${widget.dataplanter[0]['date_prepare']}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff757575),
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                        ],
                                      ),
                                      indicatorStyle: widget.dataplanter[0]
                                                      ['status'] ==
                                                  0 &&
                                              widget.dataplanter[0]
                                                      ['tracking'] ==
                                                  1
                                          ? IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.red,
                                            )
                                          : IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.grey,
                                            ),
                                      beforeLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                      afterLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                    )),
                                SizedBox(
                                    height: 80,
                                    child: TimelineTile(
                                      endChild: Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(8)),
                                              Icon(
                                                Icons.emoji_people_outlined,
                                                size: 33,
                                                color: Color(0xff757575),
                                              ),
                                              SizedBox(width: 20),
                                              Text('Planting'),
                                            ],
                                          ),
                                          widget.dataplanter[0]['status'] ==
                                                      0 &&
                                                  widget.dataplanter[0]
                                                          ['tracking'] ==
                                                      2
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(12)),
                                                    SizedBox(width: 45),
                                                    Text(
                                                      'Order cancel!!',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              : widget.dataplanter[0]
                                                          ['date_planting'] ==
                                                      null
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12)),
                                                        SizedBox(width: 45),
                                                        Text(
                                                          '${widget.dataplanter[0]['date_planting']}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff757575),
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                        ],
                                      ),
                                      indicatorStyle: widget.dataplanter[0]
                                                      ['status'] ==
                                                  0 &&
                                              widget.dataplanter[0]
                                                      ['tracking'] ==
                                                  2
                                          ? IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.red,
                                            )
                                          : IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.grey,
                                            ),
                                      beforeLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                      afterLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                    )),
                                SizedBox(
                                    height: 80,
                                    child: TimelineTile(
                                      endChild: Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(8)),
                                              Icon(
                                                Icons.grass_outlined,
                                                size: 33,
                                                color: Color(0xff757575),
                                              ),
                                              SizedBox(width: 20),
                                              Text('Harvest'),
                                            ],
                                          ),
                                          widget.dataplanter[0]['status'] ==
                                                      0 &&
                                                  widget.dataplanter[0]
                                                          ['tracking'] ==
                                                      3
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(12)),
                                                    SizedBox(width: 45),
                                                    Text(
                                                      'Order cancel!!',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              : widget.dataplanter[0]
                                                          ['date_harvest'] ==
                                                      null
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12)),
                                                        SizedBox(width: 45),
                                                        Text(
                                                          '${widget.dataplanter[0]['date_harvest']}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff757575),
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                        ],
                                      ),
                                      indicatorStyle: widget.dataplanter[0]
                                                      ['status'] ==
                                                  0 &&
                                              widget.dataplanter[0]
                                                      ['tracking'] ==
                                                  3
                                          ? IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.red,
                                            )
                                          : IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.grey,
                                            ),
                                      beforeLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                      afterLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                    )),
                                SizedBox(
                                    height: 80,
                                    child: TimelineTile(
                                      endChild: Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(8)),
                                              Icon(
                                                Icons.airport_shuttle_outlined,
                                                size: 33,
                                                color: Color(0xff757575),
                                              ),
                                              SizedBox(width: 20),
                                              Text('Delivery'),
                                            ],
                                          ),
                                          widget.dataplanter[0]['status'] ==
                                                      0 &&
                                                  widget.dataplanter[0]
                                                          ['tracking'] ==
                                                      4
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(12)),
                                                    SizedBox(width: 45),
                                                    Text(
                                                      'Order cancel!!',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              : widget.dataplanter[0]
                                                          ['date_delivery'] ==
                                                      null
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12)),
                                                        SizedBox(width: 45),
                                                        Text(
                                                          '${widget.dataplanter[0]['date_delivery']}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff757575),
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                        ],
                                      ),
                                      indicatorStyle: widget.dataplanter[0]
                                                      ['status'] ==
                                                  0 &&
                                              widget.dataplanter[0]
                                                      ['tracking'] ==
                                                  4
                                          ? IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.red,
                                            )
                                          : IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.grey,
                                            ),
                                      beforeLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                      afterLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                    )),
                                SizedBox(
                                    height: 80,
                                    child: TimelineTile(
                                      endChild: Column(
                                        children: [
                                          Padding(padding: EdgeInsets.all(10)),
                                          Row(
                                            children: <Widget>[
                                              Padding(
                                                  padding: EdgeInsets.all(8)),
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
                                          widget.dataplanter[0]['status'] ==
                                                      0 &&
                                                  widget.dataplanter[0]
                                                          ['tracking'] ==
                                                      5
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.all(12)),
                                                    SizedBox(width: 45),
                                                    Text(
                                                      'Order cancel!!',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 12),
                                                    ),
                                                  ],
                                                )
                                              : widget.dataplanter[0]
                                                          ['date_success'] ==
                                                      null
                                                  ? Container()
                                                  : Row(
                                                      children: [
                                                        Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12)),
                                                        SizedBox(width: 45),
                                                        Text(
                                                          '${widget.dataplanter[0]['date_success']}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xff757575),
                                                              fontSize: 12),
                                                        ),
                                                      ],
                                                    )
                                        ],
                                      ),
                                      isLast: true,
                                      indicatorStyle: widget.dataplanter[0]
                                                      ['status'] ==
                                                  0 &&
                                              widget.dataplanter[0]
                                                      ['tracking'] ==
                                                  5
                                          ? IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.red,
                                            )
                                          : IndicatorStyle(
                                              //indicator: ,
                                              color: Colors.grey,
                                            ),
                                      beforeLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
                                      afterLineStyle: LineStyle(
                                          color: Colors.grey, thickness: 2),
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
                          widget.dataplanter[0]['status'] == 0 &&
                                  widget.dataplanter[0]['tracking'] != 6
                              ? Container(
                                  padding: EdgeInsets.all(14.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                                  Icons.star_outlined,
                                                  color: Colors.orange,
                                                ),
                                            onRatingUpdate: (rating) {}),
                                      ),
                                      //SizedBox(width: 100),
                                      Row(
                                        children: [
                                          Text(
                                            '${widget.namecustomer[0]['name']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.account_circle_outlined,
                                              color: Color(0xff606060),
                                              size: 30),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  padding: EdgeInsets.all(14),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      RatingBar.builder(
                                        itemSize: 30,
                                        initialRating: widget.dataplanter[0]
                                                ['rating']
                                            .toDouble(),
                                        minRating: widget.dataplanter[0]
                                                ['rating']
                                            .toDouble(),
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding:
                                            EdgeInsets.symmetric(horizontal: 1),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star_outlined,
                                          color: Colors.orange,
                                        ),
                                        onRatingUpdate: (rating) {},
                                      ),
                                      SizedBox(width: 100),
                                      Row(
                                        children: [
                                          Text(
                                            '${widget.namecustomer[0]['name']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(width: 10),
                                          Icon(Icons.account_circle_outlined,
                                              color: Color(0xff606060),
                                              size: 30),
                                        ],
                                      )
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
