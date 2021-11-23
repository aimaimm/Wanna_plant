import 'package:flutter/material.dart';

class chatPage extends StatefulWidget {
  const chatPage({Key? key}) : super(key: key);

  @override
  _chatPageState createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'Chat',
              style: TextStyle(
                fontSize: 24.0, 
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 50,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      'John Do',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Hi, There',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[400],
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      'Jan Do',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Hi, There',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[400],
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.account_circle,
                  size: 50,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Text(
                      'Jun Do',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Hi, There',
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
     bottomNavigationBar: ClipRRect(
        
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
        child: BottomNavigationBar(
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
      ),
    );
  }
}
