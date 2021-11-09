import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class Description_input extends StatelessWidget {
  const Description_input({
    Key? key,
    required this.description,
  }) : super(key: key);

  final TextEditingController description;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: description,
        maxLines: 4,
        style: TextStyle(
          fontSize: 12,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintStyle: TextStyle(
            fontSize: 10,
          ),
          fillColor: txtg,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}