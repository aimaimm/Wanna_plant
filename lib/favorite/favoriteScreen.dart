import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/data/data_customer.dart';
import 'package:wanna_plant/favorite/myCard_favorite.dart';

class FavoriteScreen extends StatefulWidget {
  // const FavoriteScreen({ Key? key }) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

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
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
