import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/History/myCard_history.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/data/data_customer.dart';
import 'package:wanna_plant/data/data_planter.dart';
import 'package:wanna_plant/favorite/myCard_favorite.dart';

class HistoryScreen extends StatefulWidget {
  // const HistoryScreen({ Key? key }) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xFFDEDEDE),
            ),
          ),
          centerTitle: true,
          title: Text(
            'History',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          bottom: TabBar(
            indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
            indicatorColor: gbase,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Planter',
              ),
              Tab(
                text: 'Customer',
              ),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return myCard_history(
                      image: data[index]['image'],
                      name: data[index]['name'],
                      price: data[index]['price'],
                      plant: data[index]['plant'],
                      rate: data[index]['rate'],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return myCard_favorite(
                      image: items[index]['image'],
                      location: items[index]['location'],
                      land: items[index]['land'],
                      plant: items[index]['plant'],
                      rate: items[index]['rate'],
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomBar(),
      ),
    );
  }
}
