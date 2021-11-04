import 'package:flutter/material.dart';

class Seeallscreen extends StatefulWidget {
  const Seeallscreen({Key? key}) : super(key: key);

  @override
  _SeeallscreenState createState() => _SeeallscreenState();
}

List Listplant = [
  {
    'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1559628233-eb1b1a45564b.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
  {
    'picture': 'assets/images/photo-1463320898484-cdee8141c787.jpg',
    'localtion': 'Chiang Rai',
    'land': '170 accur',
    'plant': 'Carrot, tree..',
  },
];

class _SeeallscreenState extends State<Seeallscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.shopping_cart_outlined),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                child: TextField(
                  onTap: () {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xffF0F0F0),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search',
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${Listplant.length.toString()} Items'),
              ],
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: Listplant.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print(Listplant[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFF9F9F9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Image.asset(
                              '${Listplant[index]['picture']}',
                              width: 150,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${Listplant[index]['localtion']}',
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '${Listplant[index]['land']}',
                                  style: TextStyle(fontSize: 10),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '${Listplant[index]['plant']}',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.star_rate,
                                  color: Colors.amber,
                                  size: 35,
                                ),
                                Text('4.7 rate'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
