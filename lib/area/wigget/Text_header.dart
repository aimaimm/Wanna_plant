import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class Text_header extends StatelessWidget {
  const Text_header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'How much ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'land',
                style: TextStyle(fontSize: 20, color: gbase),
              ),
              Text(
                ' do you own?',
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ],
      ),
    );
  }
}