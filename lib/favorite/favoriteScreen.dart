import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/favorite/myCard_favorite.dart';
import 'package:http/http.dart' as http;
import 'package:wanna_plant/login/loginScreen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key, required this.userdata}) : super(key: key);

  final List userdata;

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List data_fav = [];
  bool buildui = false;

  Future<void> loaddata() async {
    Uri uri = Uri.http(url, "/datafavorite");
    try {
      http.Response response = await http.post(uri, body: {
        'user_id': userdata[0]['user_id'].toString(),
        'check_role': "user",
      });
      if (response.statusCode == 200) {
        List rawdata_fav = jsonDecode(response.body);
        for (int i = 0; i < rawdata_fav.length; i++) {
          if (rawdata_fav[i]['land_unit'] == "Square Centimeter") {
            rawdata_fav[i]['land_unit'] = "Square CM";
          } else if (rawdata_fav[i]['land_unit'] == "Square Meter") {
            rawdata_fav[i]['land_unit'] = "Square M";
          } else {
            rawdata_fav[i]['land_unit'] = "Square KM";
          }

          if (rawdata_fav[i]['rating'] == null) {
            rawdata_fav[i]['rating'] = 0;
          }

          if (data_fav.length == 0) {
            if (widget.userdata[0]['user_id'] != rawdata_fav[i]['user_id']) {
              data_fav.add(
                {
                  'pic_name': "http://$url/${rawdata_fav[i]['pic_name']}",
                  'land_id': rawdata_fav[i]['land_id'],
                  'land_area': rawdata_fav[i]['land_area'],
                  'land_unit': rawdata_fav[i]['land_unit'],
                  'plants_name': rawdata_fav[i]['plants_name'],
                  'province': rawdata_fav[i]['province'],
                  'rating': rawdata_fav[i]['rating'],
                },
              );
            }
          } else if (data_fav[data_fav.length - 1]['land_id'] ==
              rawdata_fav[i]['land_id']) {
            List stack_plant = [];
            if (widget.userdata[0]['user_id'] != rawdata_fav[i]['user_id']) {
              // print(i);
              if (data_fav[data_fav.length - 1]['plants_name'] is List) {
                for (int p = 0;
                    p < data_fav[data_fav.length - 1]['plants_name'].length;
                    p++) {
                  stack_plant
                      .add(data_fav[data_fav.length - 1]['plants_name'][p]);
                }
              } else {
                stack_plant.add(data_fav[data_fav.length - 1]['plants_name']);
              }
              // print(stack_plant);
              // print(data_land[data_land.length - 1]['plants_name']);
              stack_plant.add(rawdata_fav[i]['plants_name']);
              // print(stack_plant);
              data_fav[data_fav.length - 1]['plants_name'] = stack_plant;
            }
          } else {
            if (widget.userdata[0]['user_id'] != rawdata_fav[i]['user_id']) {
              data_fav.add(
                {
                  'pic_name': rawdata_fav[i]['pic_name'] =
                      "http://$url/${rawdata_fav[i]['pic_name']}",
                  'land_id': rawdata_fav[i]['land_id'],
                  'land_area': rawdata_fav[i]['land_area'],
                  'land_unit': rawdata_fav[i]['land_unit'],
                  'plants_name': rawdata_fav[i]['plants_name'],
                  'province': rawdata_fav[i]['province'],
                  'rating': rawdata_fav[i]['rating'],
                },
              );
            }
          }
        }
        
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
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildui
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0,
              title: Text(
                'Favorite',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: data_fav.length,
                  itemBuilder: (context, index) {
                    return myCard_favorite(
                      data_fav: data_fav,
                      index: index,
                    );
                  }),
            ),
            bottomNavigationBar: CustomBottomBar(),
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
