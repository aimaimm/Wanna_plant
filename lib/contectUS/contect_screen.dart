import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class Contect_Screen extends StatelessWidget {
  const Contect_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.grey,
        ),
        centerTitle: true,
        title: const Text(
          'Contect Us',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            left: size.width * 10 / 70,
            top: size.height * 2.5 / 45,
            child: Container(
              width: size.width * 2.5 / 35,
              height: size.width * 2.5 / 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: gbase.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            top: size.height * 2 / 40,
            right: size.width * 6 / 46,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: gbase.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            top: size.height * 5 / 65,
            right: size.width * 0.8 / 20,
            child: Container(
              width: 170,
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  color: gbase.withOpacity(0.15)),
            ),
          ),
          Positioned(
            top: size.height * 8 / 83,
            right: size.width * 2.5 / 35,
            child: Container(
              width: 152,
              height: 152,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200), color: gbase),
            ),
          ),
          Positioned(
            top: size.height * 11 / 98,
            right: size.width * 3.5 / 40,
            child: Container(
              width: 397,
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(129),
                ),
                color: Color(0XFFF6F6F6),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 32,
                          color: gbase,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('(600) 254-741-41785')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.mail,
                          size: 32,
                          color: gbase,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text('o1plant.office@wannaplant.aw.th')
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 65),
                          child: Icon(
                            Icons.access_time_filled,
                            size: 32,
                            color: gbase,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Monday-Friday'),
                            Text('8am-6pm'),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Saturday-Sunday'),
                            Text('10am-4pm'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 1 / -30,
            left: size.width * 8 / -60,
            child: Container(
              width: 152,
              height: 152,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: gbase.withOpacity(0.25),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 50 / 210,
            left: size.width * 100 / 230,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: gbase.withOpacity(0.15),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 10 / 80,
            right: size.width * 5 / 50,
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                color: gbase.withOpacity(0.15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
