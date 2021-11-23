import 'package:flutter/material.dart';

class myCard_history extends StatelessWidget {
  String image, name, plant;
  double rate;
  int price;

  myCard_history({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.plant,
    required this.rate,
  }) : super(key: key);

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
            child: Image.asset(
              image,
              width: 90,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          title: (Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                plant,
                style: TextStyle(fontSize: 10),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$price baht.',
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
                '$rate rate',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
