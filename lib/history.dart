import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

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
          children: [
            Center(
              child: Text('Platre'),
            ),
            Center(
              child: Text('Custom'),
            ),
          ],
        ),
      ),
    );
  }
}
