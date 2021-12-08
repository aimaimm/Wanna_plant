import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:timeline_tile/timeline_tile.dart';
// ignore: unused_import
//import 'package:timelines/timelines.dart';

class TrackingSuccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrackingSuccess();
}

class _TrackingSuccess extends State<TrackingSuccess> {
  int currentStep = 0;

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
      body: Center(
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
                    fillColor: Color(0xffF0F0F0),
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
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 430,
                      height: 650,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: ListTile(
                                title: Text(
                                  '#0${index + 1}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing: Text('12/09/64',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff848484))),
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
                                            Padding(
                                                padding: EdgeInsets.all(10)),
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
                                          ],
                                        ),
                                        isFirst: true,
                                        indicatorStyle: IndicatorStyle(
                                          //indicator: ,
                                          color: Color(0xff7CC671),
                                        ),
                                        afterLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
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
                                            color: Color(0xff7CC671),
                                            thickness: 2),
                                        afterLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
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
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
                                          //indicator: ,
                                          color: Color(0xff7CC671),
                                        ),
                                        beforeLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
                                        afterLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
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
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
                                          //indicator: ,
                                          color: Color(0xff7CC671),
                                        ),
                                        beforeLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
                                        afterLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
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
                                          ],
                                        ),
                                        indicatorStyle: IndicatorStyle(
                                          //indicator: ,
                                          color: Color(0xff7CC671),
                                        ),
                                        beforeLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
                                        afterLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
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
                                          ],
                                        ),
                                        isLast: true,
                                        indicatorStyle: IndicatorStyle(
                                          //indicator: ,
                                          color: Color(0xff7CC671),
                                        ),
                                        beforeLineStyle: LineStyle(
                                            color: Color(0xff7CC671),
                                            thickness: 2),
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
