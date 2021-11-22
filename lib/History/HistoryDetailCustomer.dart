import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HistoryCustomer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryCustomer();
}

class _HistoryCustomer extends State<HistoryCustomer> {
  int currentStep = 0;

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
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: SizedBox(
                child: Container(
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.all(13)),
                      Container(
                        padding: EdgeInsets.all(11),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Success',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Thank you for plant',
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
                  color: Color(0xFF7CC671),
                ),
                height: 75,
              ),
            ),
            Expanded(
              child: Container(
                width: 450,
                child: ListView(
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
                                child: Icon(Icons.location_pin),
                              ),
                              Container(
                                child: Text(
                                  ' Address for plant',
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
                                  'John John \n(+66) 0812345678 \n444/85 \nAmphoe Meaung ChaniRar 52300',
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
                          //Padding(padding: EdgeInsets.all(8)),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.all(12)),
                              Container(
                                child: Icon(Icons.landscape_outlined),
                              ),
                              Container(
                                child: Text(
                                  '  107 accur',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(padding: EdgeInsets.all(12)),
                              Container(
                                child: Icon(Icons.grass_outlined),
                              ),
                              Container(
                                child: Text(
                                  '  Carrot',
                                  style: TextStyle(fontSize: 12),
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
                                  ' 8000 Baht.',
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
                    SizedBox(
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: ListTile(
                                title: Text(
                                  '#01',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing: Text(
                                  '12/09/64',
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
                                              Padding(
                                                  padding: EdgeInsets.all(8)),
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
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.all(12)),
                                              SizedBox(width: 45),
                                              Text(
                                                '12/09/64',
                                                style: TextStyle(
                                                    color: Color(0xff757575),
                                                    fontSize: 12),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      isFirst: true,
                                      indicatorStyle: IndicatorStyle(
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
                                            Padding(
                                                padding: EdgeInsets.all(10)),
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
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(12)),
                                                SizedBox(width: 45),
                                                Text(
                                                  '18/09/64',
                                                  style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
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
                                            Padding(
                                                padding: EdgeInsets.all(10)),
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
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(12)),
                                                SizedBox(width: 45),
                                                Text(
                                                  '20/09/64',
                                                  style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
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
                                            Padding(
                                                padding: EdgeInsets.all(10)),
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
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(12)),
                                                SizedBox(width: 45),
                                                Text(
                                                  '30/09/64',
                                                  style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
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
                                            Padding(
                                                padding: EdgeInsets.all(10)),
                                            Row(
                                              children: <Widget>[
                                                Padding(
                                                    padding: EdgeInsets.all(8)),
                                                Icon(
                                                  Icons
                                                      .airport_shuttle_outlined,
                                                  size: 33,
                                                  color: Color(0xff757575),
                                                ),
                                                SizedBox(width: 20),
                                                Text('Delivery'),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(12)),
                                                SizedBox(width: 45),
                                                Text(
                                                  '05/10/64',
                                                  style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
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
                                            Padding(
                                                padding: EdgeInsets.all(10)),
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
                                            Row(
                                              children: [
                                                Padding(
                                                    padding:
                                                        EdgeInsets.all(12)),
                                                SizedBox(width: 45),
                                                Text(
                                                  '10/10/64',
                                                  style: TextStyle(
                                                      color: Color(0xff757575),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        isLast: true,
                                        indicatorStyle: IndicatorStyle(
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
                            Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RatingBar.builder(
                                      itemSize: 30,
                                      initialRating: 5,
                                      minRating: 5,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      itemBuilder: (context, _) => Icon(
                                            Icons.star_outlined,
                                            color: Colors.orange,
                                          ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      }),
                                  SizedBox(width: 100),
                                  Text(
                                    'Jan Jukoo',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.account_circle_outlined,
                                      color: Color(0xff606060), size: 30)
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
            SizedBox(
              child: Container(
                child: TextButton(
                  child: Container(
                    width: 250,
                    alignment: Alignment.center,
                    child: Text('Order again'),
                  ),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Color(0xFF7CC671),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
