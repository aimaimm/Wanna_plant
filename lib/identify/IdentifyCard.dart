import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wanna_plant/constants.dart';
import 'package:image_picker/image_picker.dart';

XFile? face;
XFile? id_card;

class IdentifyCard extends StatefulWidget {
  const IdentifyCard({
    Key? key,
  }) : super(key: key);

  @override
  State<IdentifyCard> createState() => _IdentifyCardState();
}

class _IdentifyCardState extends State<IdentifyCard> {
  final ImagePicker _picker = ImagePicker();

//---------------------face photo-------------------------------------------
  Future Face() async {
    final selectimage = await _picker.pickImage(source: ImageSource.gallery);
    print(selectimage!.path);

    setState(() {
      face = selectimage;
    });
  }

//-----------------ID card---------------------------------------------
  Future IDCARD() async {
    final selectimage = await _picker.pickImage(source: ImageSource.gallery);
    print(selectimage!.path);

    setState(() {
      id_card = selectimage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 0,
          color: txtg,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: face == null
                ? Image.asset('assets/images/scan.png')
                : Image.file(
                    File(face!.path),
                    fit: BoxFit.cover,
                    //width: 50,
                  ),
            title: Text(
              'Face Photo',
              style: TextStyle(fontSize: 13),
            ),
            trailing: Container(
              height: 40,
              width: 65,
              //padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: gbase,
              ),
              child: IconButton(
                onPressed: () => Face(),
                icon: Icon(Icons.arrow_forward),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          elevation: 0,
          color: txtg,
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: id_card == null
                ? Image.asset('assets/images/idCard.png')
                : Image.file(
                    File(id_card!.path),
                    fit: BoxFit.cover,
                    //width: 50,
                  ),
            title: Text(
              'ID Card',
              style: TextStyle(fontSize: 13),
            ),
            trailing: Container(
              height: 40,
              width: 65,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: gbase,
              ),
              child: IconButton(
                onPressed: () {
                  IDCARD();
                  setState(() {});
                },
                icon: Icon(
                  Icons.arrow_forward,
                ),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
