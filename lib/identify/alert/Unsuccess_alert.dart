import 'package:flutter/material.dart';
import 'package:wanna_plant/identify/waitIdentifyScreen.dart';

Future Unsuccess(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Icon(
          Icons.error,
          size: 60,
          color: Colors.yellow,
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            children: [
              Text(
                'Please check "I agree"',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
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
