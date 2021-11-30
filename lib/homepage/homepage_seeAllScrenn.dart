import 'package:flutter/material.dart';
import 'package:wanna_plant/homepage/DetailLand/DetailScreen.dart';

class Seeallscreen extends StatefulWidget {
  const Seeallscreen({Key? key, required this.data_land}) : super(key: key);

  final List data_land;

  @override
  _SeeallscreenState createState() => _SeeallscreenState();
}

class _SeeallscreenState extends State<Seeallscreen> {
  String plant_text(datatext) {
    if (datatext.length < 2) {
      return "${datatext[0]}";
    } else {
      return "${datatext[0]}, ${datatext[1]}...";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          title: Container(
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
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5, color: Colors.grey),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('${widget.data_land.length.toString()} Items'),
                  ],
                ),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.data_land.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              idland: widget.data_land[index]['land_id'],
                            ),
                          ),
                        );
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
                                child: Image.network(
                                  '${widget.data_land[index]['pic_name']}',
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${widget.data_land[index]['province']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Land: ${widget.data_land[index]['land_area']} ${widget.data_land[index]['land_unit']}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      plant_text(widget.data_land[index]
                                          ['plants_name']),
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              widget.data_land[index]['rating'] == 0
                                  ? Center(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.star_rate,
                                            color: Colors.grey,
                                            size: 25,
                                          ),
                                          Text(
                                            '${widget.data_land[index]['rating']} rate',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Center(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.star_rate,
                                            color: Colors.amber,
                                            size: 25,
                                          ),
                                          Text(
                                            '${widget.data_land[index]['rating']} rate',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
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
