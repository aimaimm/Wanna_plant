import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/homepage/homepage_seeAllScrenn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.idland}) : super(key: key);

  final int idland;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool showBotton_sheet = false;
  bool build_check = false;
  String main_picture = "";

  List detail_land = [];
  void infoland() async {
    Uri uri_infoland = Uri.http(url, "/infoland");
    Uri uri_infolandpic = Uri.http(url, "/infolandpic");
    try {
      http.Response response = await http.post(uri_infoland,
          body: {'idland': widget.idland.toString(), 'user_check': "user"});
      http.Response response_picture = await http.post(uri_infolandpic,
          body: {'idland': widget.idland.toString(), 'user_check': "user"});
      if (response.statusCode == 200 && response_picture.statusCode == 200) {
        List rawdata_land = jsonDecode(response.body);
        List pic_land = jsonDecode(response_picture.body);
        for (int i = 0; i < rawdata_land.length; i++) {
          // rawdata_land[i]['pic_name'] =
          //     "http://$url/${rawdata_land[i]['pic_name']}";
          if (rawdata_land[i]['land_unit'] == "Square Centimeter") {
            rawdata_land[i]['land_unit'] = "Square CM";
          } else if (rawdata_land[i]['land_unit'] == "Square Meter") {
            rawdata_land[i]['land_unit'] = "Square M";
          } else {
            rawdata_land[i]['land_unit'] = "Square KM";
          }
          if (rawdata_land[i]['rating'] == null) {
            rawdata_land[i]['rating'] = 0;
          }

          if (detail_land.length == 0) {
            detail_land.add(
              {
                // 'pic_name': rawdata_land[i]['pic_name'],
                'pic_name': pic_land,
                'user_id': rawdata_land[i]['user_id'],
                'province': rawdata_land[i]['province'],
                'name': rawdata_land[i]['name'],
                'land_area': rawdata_land[i]['land_area'],
                'land_unit': rawdata_land[i]['land_unit'],
                'land_description': rawdata_land[i]['land_description'],
                'plants_name': rawdata_land[i]['plants_name'],
                'plants_price': rawdata_land[i]['plants_price'],
                'rating': rawdata_land[i]['rating'],
                'planted': rawdata_land[i]['planted'],
              },
            );
          } else {
            // if (detail_land[detail_land.length - 1]['pic_name'] !=
            //     rawdata_land[i]['pic_name']) {
            //   List stack_plant = [];
            //   stack_plant.add(detail_land[i - 1]['pic_name']);
            //   stack_plant.add(rawdata_land[i]['pic_name']);
            //   detail_land[i - 1]['pic_name'] = stack_plant;
            // }
            if (detail_land[detail_land.length - 1]['plants_name'] !=
                rawdata_land[i]['plants_name']) {
              List stack_plant_name = [];
              stack_plant_name.add(detail_land[i - 1]['plants_name']);
              stack_plant_name.add(rawdata_land[i]['plants_name']);
              detail_land[i - 1]['plants_name'] = stack_plant_name;
              List stack_plant_price = [];
              stack_plant_price.add(detail_land[i - 1]['plants_price']);
              stack_plant_price.add(rawdata_land[i]['plants_price']);
              detail_land[i - 1]['plants_price'] = stack_plant_price;
            }
          }
        }
        for (int i = 0; i < detail_land[0]['pic_name'].length; i++) {
          // print(detail_land[0]['pic_name'][i]['pic_name']);
          detail_land[0]['pic_name'][i]['pic_name'] =
              "http://$url/${detail_land[0]['pic_name'][i]['pic_name']}";
          // List stack_plant = [];
          // stack_plant.add(detail_land[i - 1]['pic_name']);
          // stack_plant.add(rawdata_land[i]['pic_name']);
          // detail_land[i - 1]['pic_name'] = stack_plant;
        }
        main_picture = detail_land[0]['pic_name'][0]['pic_name'];

        setState(() {
          print(detail_land);
          build_check = true;
        });
      }
    } catch (e) {
      print(e);
      print("connection error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    infoland();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return build_check
        ? Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Cart');
                  },
                  icon: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        main_picture,
                        width: size.width,
                        height: 350,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${detail_land[0]['province']}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Land: ${detail_land[0]['land_area']} ${detail_land[0]['land_unit']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ],
                        ),
                        detail_land[0]['rating'] == 0
                            ? Column(
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  Text('${detail_land[0]['rating']} rate'),
                                ],
                              )
                            : Column(
                                children: [
                                  Icon(
                                    Icons.star_rate,
                                    color: Colors.amber,
                                    size: 35,
                                  ),
                                  Text('${detail_land[0]['rating']} rate'),
                                ],
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          '${detail_land[0]['land_description']}',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 0.3, color: Colors.grey),
                          bottom: BorderSide(width: 0.3, color: Colors.grey),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              margin: EdgeInsets.only(
                                right: 20,
                              ),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Icon(
                                Icons.person,
                                size: 27,
                                color: Colors.grey,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${detail_land[0]['name']}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Planted: ${detail_land[0]['planted']}',
                                  style: TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                    ),
                    child: Text(
                      'Photos',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: detail_land[0]['pic_name'].length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    main_picture = detail_land[0]['pic_name']
                                        [index]['pic_name'];
                                    setState(() {});
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(13),
                                      child: Image.network(
                                        detail_land[0]['pic_name'][index]
                                            ['pic_name'],
                                        width: 150,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      bottom: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.favorite_border_outlined),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            primary: gbase,
                            minimumSize: Size(270, 50),
                          ),
                          onPressed: () {
                            setState(() {
                              showBotton_sheet = true;
                            });
                          },
                          child: Text(
                            'Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomSheet: showBotton_sheet
                ? Container(
                    height: 350,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showBotton_sheet = false;
                                      });
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 15),
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'Carrot 1200 baht/kg',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                            left: 30,
                            right: 30,
                            bottom: 20,
                          ),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Amount',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                          icon: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 2,
                                              horizontal: 7,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text('-'),
                                          ),
                                        ),
                                        Text('0'),
                                        IconButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                          icon: Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 2,
                                              horizontal: 7,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1, color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Text('+'),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    primary: gbase,
                                    minimumSize: Size(double.infinity, 50),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showBotton_sheet = true;
                                    });
                                  },
                                  child: Text(
                                    'Add to cart',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : null,
          )
        : Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
