import 'package:flutter/material.dart';
import 'package:wanna_plant/homepage/DetailLand/DetailScreen.dart';
import 'package:wanna_plant/login/loginScreen.dart';

class myCard_favorite extends StatelessWidget {
  myCard_favorite({
    Key? key,
    required this.data_fav,
    required this.index,
  }) : super(key: key);

  final List data_fav;
  final int index;

  String plant_text(datatext) {
    if (datatext is List) {
      if (datatext.length < 2) {
        return "${datatext[0]}";
      } else {
        return "${datatext[0]}, ${datatext[1]}...";
      }
    } else {
      return "$datatext";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              idland: data_fav[index]['land_id'],
              datauser: userdata,
            ),
          ),
        );
      },
      child: Card(
        elevation: 0,
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
              child: Image.network(
                "${data_fav[index]['pic_name']}",
                width: 90,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            title: (Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data_fav[index]['province']}",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Land: ${data_fav[index]['land_area']} ${data_fav[index]['land_unit']}',
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  plant_text(data_fav[index]['plants_name']),
                  style: TextStyle(fontSize: 10),
                )
              ],
            )),
            trailing: data_fav[index]['rating'] == 0
                ? Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.star_rate,
                        color: Colors.grey,
                      ),
                      Text(
                        '${data_fav[index]['rating']}',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        '${data_fav[index]['rating']}',
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
