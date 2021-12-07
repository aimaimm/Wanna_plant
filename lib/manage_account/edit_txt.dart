import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

class edit_txt extends StatefulWidget {
  const edit_txt({
    Key? key,
    required this.userdata,
  }) : super(key: key);

  final List userdata;

  @override
  _edit_txtState createState() => _edit_txtState();
}

class _edit_txtState extends State<edit_txt> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TxtField_edit(
          hintText: 'Yourname',
          icon: Icon(
            Icons.edit_sharp,
            size: 15,
          ),
        ),
        SizedBox(
          height: 13,
        ),
        TextField(
          readOnly: true,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: 'Username',
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
          height: 13,
        ),
        TextField(
          readOnly: true,
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
        TxtField_edit(
          hintText: 'Phone number',
          icon: Icon(
            Icons.edit_sharp,
            size: 15,
          ),
        ),
        SizedBox(
          height: 13,
        ),
        Container(
          height: 5 * 24.0,
          child: TextField(
            maxLines: 5,
            style: TextStyle(
              fontSize: 12,
            ),
            decoration: InputDecoration(
              suffix: Icon(
                Icons.edit_sharp,
                size: 15,
              ),
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
        TxtField_edit(
          hintText: 'Protmptpay',
          icon: Icon(
            Icons.edit_sharp,
            size: 15,
          ),
        ),
      ],
    );
  }
}

class TxtField_edit extends StatelessWidget {
  const TxtField_edit({
    Key? key,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final String hintText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
        suffixIcon: icon,
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
