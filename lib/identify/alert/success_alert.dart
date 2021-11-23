import 'package:flutter/material.dart';
import 'package:wanna_plant/identify/waitIdentifyScreen.dart';

Future successAlert(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Icon(
          Icons.check_circle,
          size: 60,
          color: Colors.green,
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            children: [
              Text(
                'Success',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/Homepage');
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: TextButton.styleFrom(
                    side: BorderSide(color: Colors.grey, width: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
