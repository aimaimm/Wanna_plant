import 'package:flutter/material.dart';

class BottomBarDemo extends StatefulWidget {
  //const BottomBarDemo({ Key? key }) : super(key: key);

  @override
  _BottomBarDemoState createState() => _BottomBarDemoState();
}

class _BottomBarDemoState extends State<BottomBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Container(
        child: Text('Hiii'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        showSelectedLabels: true,
        // unselectedIconTheme:
        //     IconThemeData(color: Colors.grey, size: 25, opacity: .8),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
