import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';
import 'package:wanna_plant/area/regis_land_Screen.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/identify/IdentifyCard.dart';

import 'package:http/http.dart' as http;

Future successAlert(
  BuildContext context,
) async {
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
              FittedBox(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    onPressed: () {
                      
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/Homepage', ModalRoute.withName('/Homepage'));
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
              ),
            ],
          ),
        ),
      );
    },
  );
}
