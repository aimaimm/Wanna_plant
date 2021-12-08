import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class myCard_history extends StatelessWidget {
  myCard_history({
    Key? key,
    required this.data,
    required this.dataname,
  }) : super(key: key);

  final List data;
  final String dataname;

  @override
  Widget build(BuildContext context) {
    return Card(
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
              'http://$url/${data[0]['pic_name']}',
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          title: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$dataname',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${data[0]['plants_name']}',
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${data[0]['total_price']} baht.',
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
                '${data[0]['rating']} rate',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
