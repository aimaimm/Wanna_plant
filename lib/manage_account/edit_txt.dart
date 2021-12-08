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

TextEditingController name = TextEditingController();
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController address = TextEditingController();
TextEditingController protmpt = TextEditingController();

class _edit_txtState extends State<edit_txt> {

  @override
  void initState() {
    name.text = widget.userdata[0]['name'];
    username.text = widget.userdata[0]['username'];
    phone.text = widget.userdata[0]['phonenumber'];
    address.text = widget.userdata[0]['address'];
    protmpt.text = widget.userdata[0]['promptpay'];
    // print(widget.userdata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: name,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.edit_sharp,
              size: 15,
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: 'Yourname',
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
          controller: username,
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
          controller: password,
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
        TextField(
          controller: phone,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.edit_sharp,
              size: 15,
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: 'Phone number',
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
        Container(
          height: 5 * 24.0,
          child: TextField(
            controller: address,
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
        TextField(
          controller: protmpt,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.edit_sharp,
              size: 15,
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: 'Protmptpay',
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
      ],
    );
  }
}

// class TxtField_edit extends StatelessWidget {
//   const TxtField_edit({
//     Key? key,
//     required this.hintText,
//     required this.icon,
//     required this.controller,
//   }) : super(key: key);

//   final String hintText;
//   final Icon icon;
//   final String controller;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       style: TextStyle(fontSize: 12),
//       decoration: InputDecoration(
//         suffixIcon: icon,
//         contentPadding: EdgeInsets.all(10),
//         hintText: hintText,
//         hintStyle: TextStyle(
//           fontSize: 10,
//         ),
//         fillColor: txtg,
//         filled: true,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: BorderSide(
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }
// }
