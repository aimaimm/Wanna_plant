import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class textInfo extends StatefulWidget {
  const textInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<textInfo> createState() => _textInfoState();
}

class _textInfoState extends State<textInfo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController number = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController transfer = TextEditingController();
    List signup = [];
   

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Style_txtFie(
          control: name,
          hintText: 'Your name',
        ),
        SizedBox(
          height: 13,
        ),
        Style_txtFie(
          control: username,
          hintText: 'Username',
        ),
        SizedBox(
          height: 13,
        ),
        TextField(
          obscureText: true,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Password',
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
        SizedBox(
          height: 16,
        ),
        Text(
          'Contact',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(
          height: 13,
        ),
        Style_txtFie(
          control: number,
          hintText: 'Phone number',
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          //margin: EdgeInsets.all(12),
          height: 5 * 24.0,
          child: TextField(
            controller: address,
            maxLines: 5,
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Address',
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
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Transfer',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(
          height: 13,
        ),
        Style_txtFie(
          control: transfer,
          hintText: 'Protmptpay',
        ),
      ],
    );
  }
}

//Textfeild Style
class Style_txtFie extends StatelessWidget {
  const Style_txtFie({
    Key? key,
    required this.control,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController control;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: control,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
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
    );
  }
}
