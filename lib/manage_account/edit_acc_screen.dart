import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:wanna_plant/manage_account/edit_txt.dart';

class Edit_acc_screen extends StatefulWidget {
  const Edit_acc_screen({
    Key? key,
    required this.userdata,
  }) : super(key: key);

  final List userdata;

  @override
  _Edit_acc_screenState createState() => _Edit_acc_screenState();
}

class _Edit_acc_screenState extends State<Edit_acc_screen> {
  @override
  Widget build(BuildContext context) {
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFDEDEDE),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          // padding: const EdgeInsets.only(left: 20, right: 20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Account',
                style: TextStyle(
                    color: gbase, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Edit your account',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: sizeH / 25,
              ),
              edit_txt(
                userdata: widget.userdata,
              ),
              SizedBox(
                height: sizeH * 0.01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 44,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Save'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFF7CC671),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(13.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
