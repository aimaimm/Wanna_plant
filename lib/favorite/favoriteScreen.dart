import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  // const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

var items = [
  {
    'location': 'Chaing Rai',
    'image': 'flowers-1.jpg',
    'land': '150*200',
    'plant': 'carrot'
  },
  {
    'detail': 'Mahasarakham',
    'image': 'flowers-1.jpg',
    'land': '200*410',
    'plant': 'vagetable'
  },
  {
    'detail': 'Khonkean',
    'image': 'flowers-1.jpg',
    'land': '600*80',
    'plant': 'flower'
  },
];

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Favorite',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              '1 Items',
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.end,
            ),
            Card(
              color: Color(0XFFF9F9F9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    child: Image.asset(
                      'assets/images/flowers-1.jpg',
                      width: 90,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: (Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chainag Rau',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Land: 150*200',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Carrot,Flower...',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )),
                  trailing: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '1.5 rate',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
