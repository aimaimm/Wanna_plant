import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanna_plant/area/PlantEntry.dart';
import 'package:wanna_plant/area/upload_imageScreen.dart';
import 'package:wanna_plant/area/wigget/Description_input.dart';
import 'package:wanna_plant/area/wigget/Text_header.dart';
import 'package:wanna_plant/area/wigget/enter_text.dart';
import 'package:wanna_plant/constants.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:image_picker/image_picker.dart';

class Regis_land_Screen extends StatefulWidget {
  const Regis_land_Screen({Key? key}) : super(key: key);

  @override
  _Regis_land_ScreenState createState() => _Regis_land_ScreenState();
}

class _Regis_land_ScreenState extends State<Regis_land_Screen> {
  String _val = 'Square Centimeter';

  TextEditingController description = TextEditingController();
  TextEditingController size_area = TextEditingController();
  var plantTEC = <TextEditingController>[];
  var priceTEC = <TextEditingController>[];
  var rowCard = [];
  bool add = true;

  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFileList = [];
  String files = '';

//------------------------add image-----------------------------------------------
  void selectImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      _imageFileList.addAll(selectedImages);
    }

    //  print('Image list lenght :${_imageFileList!.length.toString()}');
    setState(() {
      //files = _imageFileList!.length.toString();
    });
  }

  //---------------------what kind of plant?------------------------------------
  addPlant() {
    var plantController = TextEditingController();
    var priceController = TextEditingController();
    plantTEC.add(plantController);
    priceTEC.add(priceController);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: enter_text(
              plantController: plantController,
              hintText: 'Plant',
            ),
          ),
          SizedBox(
            width: 7,
          ),
          Expanded(
              child: enter_text(
            plantController: priceController,
            hintText: 'Baht/Kg.',
          )),
          SizedBox(
            width: 7,
          ),
        ],
      ),
    );
  }

  //------------------------List dropdown measure------------------------------
  List<DropdownMenuItem<String>> createDD() {
    List<String> unit = [
      'Square Centimeter',
      'Square Meter',
      'Square Kilometer'
    ];
    return unit
        .map(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: TextStyle(fontSize: 12),
            ),
          ),
        )
        .toList();
  }

//----------------------confirm button------------------------------------------
  _Next() {
    List<PlantEntry> entries = [];
    for (int i = 0; i < rowCard.length; i++) {
      var name = plantTEC[i].text;
      var price = priceTEC[i].text;
      var size = size_area.text;
      var descrip = description.text;

      entries.add(
        PlantEntry(name, price, _val, size, descrip),
      );
    }
    //Navigator.pop(context, entries);
    print(entries);
    setState(() {
      Navigator.pushNamed(context, '/Identity');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rowCard.add(addPlant());
  }

  @override
  Widget build(BuildContext context) {
    // String data = ModalRoute.of(context)!.settings.arguments as String;
    var sizeH = MediaQuery.of(context).size.height;
    var sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      //extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: sizeH / 14.5,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFFDEDEDE),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: sizeW * 0.26,
              child: TextButton(
                onPressed: () {
                  _Next();
                },
                child: Text(
                  'Next',
                  style: TextStyle(color: gbase),
                ),
                style: TextButton.styleFrom(
                  primary: gbase,
                  side: BorderSide(color: gbase, width: 0.4),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(8),
          // width: sizeW,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text_header(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: enter_text(
                      plantController: size_area,
                      hintText: 'Size of area',
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      //height: 48,
                      decoration: BoxDecoration(
                        color: txtg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _val,
                          items: createDD(),
                          onChanged: (String? newvalue) {
                            setState(() {
                              _val = newvalue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: selectImage,
                    child: _imageFileList.length == 0
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Container(
                              height: sizeH * 0.13,
                              width: sizeW * 0.95,
                              color: gbase.withOpacity(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_rounded,
                                    color: gbase,
                                  ),
                                  Text(
                                    'Upload your land image',
                                    style: TextStyle(fontSize: 9, color: gbase),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Card(
                            child: Container(
                              height: sizeH * 0.13,
                              width: sizeW * 0.21,
                              color: gbase.withOpacity(0.1),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo_rounded,
                                    color: gbase,
                                  ),
                                  Text(
                                    'Upload image',
                                    style: TextStyle(fontSize: 9, color: gbase),
                                  ),
                                ],
                              ),
                              // child: TextButton(
                              //   onPressed: () {
                              //     // Navigator.pushNamed(context, '/upload_image');
                              //     selectImage();
                              //   },
                              //   child: Text(
                              //     'upload your land',
                              //     style: TextStyle(fontSize: 11),
                              //   ),
                              //   style: TextButton.styleFrom(
                              //     primary: gbase,
                              //     side: BorderSide(color: gbase, width: 0.4),
                              //   ),
                              // ),
                            ),
                          ),
                  ),
                  Expanded(
                      child: Container(
                    width: sizeW,
                    height: sizeH * 0.13,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _imageFileList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Stack(
                            //clipBehavior: Clip.none,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.file(
                                  File(
                                    _imageFileList[index].path,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  onPressed: () {
                                    _imageFileList.removeAt(index);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.do_disturb_on,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: _imageFileList.length == 0
                    ? Text(
                        '',
                      )
                    : Text(
                        'image = ${_imageFileList.length.toString()}',
                        style: TextStyle(color: gbase, fontSize: 8),
                      ),
              ),
              // SizedBox(
              //   height: 5,
              // ),
              Text('Description'),
              SizedBox(
                height: 8,
              ),
              Description_input(description: description),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('What kind of plant?'),
                  GestureDetector(
                    onTap: () {
                      setState(
                        () => rowCard.add(
                          addPlant(),
                        ),
                      );
                    },
                    child: Text(
                      'Add more plant',
                      style: TextStyle(
                          color: gbase,
                          decoration: TextDecoration.underline,
                          fontSize: 13),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rowCard.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: rowCard[index],
                              flex: 15,
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    rowCard.removeAt(index);
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Colors.red[300],
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       _Confirm();
              //     },
              //     child: Text('Confirm'),
              //     style: ElevatedButton.styleFrom(
              //       primary: gbase,
              //       fixedSize: Size(sizeW, 40),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
