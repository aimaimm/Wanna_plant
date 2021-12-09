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
import 'package:wanna_plant/identify/identifyScreen.dart';
import 'package:wanna_plant/profile/profileScreen.dart';

String? size;
String? descrip;
String? val;
List<XFile> imageFileList = [];
List entries = [];
bool infoland = true;
List plantTEC = [];
List priceTEC = [];
List rowCard = [];
String check_role_profile = "guest";

class Regis_land_Screen extends StatefulWidget {
  const Regis_land_Screen({
    Key? key,
  }) : super(key: key);

  @override
  _Regis_land_ScreenState createState() => _Regis_land_ScreenState();
}

class _Regis_land_ScreenState extends State<Regis_land_Screen> {
  TextEditingController description = TextEditingController();
  TextEditingController size_area = TextEditingController();

  bool add = true;

  final ImagePicker _picker = ImagePicker();

  String files = '';

//------------------------add image-----------------------------------------------
  void selectImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }

    //  print('Image list lenght :${_imageFileList!.length.toString()}');
    setState(() {
      //files = _imageFileList!.length.toString();
    });
  }

  //---------------------what kind of plant?------------------------------------
  addPlant() {
    TextEditingController plantController = TextEditingController();
    TextEditingController priceController = TextEditingController();
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
  _Next() async {
    if (check_role_profile == "guest") {
      size = size_area.text;
      descrip = description.text;
      int? size_check = int.tryParse(size!);

      if (size == "" ||
          descrip == "" ||
          imageFileList.length == 0 ||
          plantTEC.length == 0) {
        infoland = false;
        setState(() {
          Navigator.pushNamed(context, '/Identity');
        });
      } else {
        int countcheck = 0;

        // check "" in list kind of plant
        for (int i = 0; i < plantTEC.length; i++) {
          if (plantTEC[i].text != "" && priceTEC[i].text != "") {
            countcheck++;
          }
        }
        if (countcheck == plantTEC.length) {
          for (int i = 0; i < rowCard.length; i++) {
            var namecon = plantTEC[i].text;
            var price = priceTEC[i].text;
            int? price_check = int.tryParse(price);
            if (price_check != null) {
              entries.add({'plantname': namecon, 'price': price});
              if ((i + 1) == rowCard.length && size_check != null) {
                infoland = true;
                setState(() {
                  // print(entries);
                  Navigator.pushNamed(context, '/Identity');
                });
              }
            }
          }

          // print(_imageFileList);
          //Navigator.pop(context, entries);
          // print(entries);

        } else {
          infoland = false;
          setState(() {
            Navigator.pushNamed(context, '/Identity');
          });
        }
      }
    } else if (check_role_profile == "user") {
      size = size_area.text;
      descrip = description.text;
      int? size_check = int.tryParse(size!);

      if (size == "" ||
          descrip == "" ||
          imageFileList.length == 0 ||
          plantTEC.length == 0) {
        infoland = false;
        showDialog(
            barrierDismissible: true,
            context: context,
            builder: (BuildContext) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                title: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.red.shade400,
                  size: 70,
                ),
                content: Text(
                  'Please complete the information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'OK',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color: Colors.grey.shade300)))),
                    ),
                  ),
                ],
              );
            });
      } else {
        int countcheck = 0;

        // check "" in list kind of plant
        for (int i = 0; i < plantTEC.length; i++) {
          if (plantTEC[i].text != "" && priceTEC[i].text != "") {
            countcheck++;
          }
        }
        // print(countcheck);
        if (countcheck == plantTEC.length) {
          for (int i = 0; i < rowCard.length; i++) {
            var namecon = plantTEC[i].text;
            var price = priceTEC[i].text;
            int? price_check = int.tryParse(price);
            if (price_check != null) {
              entries.add({'plantname': namecon, 'price': price});
              if ((i + 1) == rowCard.length && size_check != null) {
                Uri uri_land = Uri.http(url, '/registerland');
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext) {
                      return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          title: Center(
                            child: CircularProgressIndicator(),
                          ));
                    });
                try {
                  http.MultipartRequest requestlandpicture =
                      http.MultipartRequest('POST', uri_land);
                  requestlandpicture.fields['size'] = size!;
                  requestlandpicture.fields['val'] = val!;
                  requestlandpicture.fields['descrip'] = descrip!;
                  requestlandpicture.fields['user_id'] =
                      jsonEncode(user_profile);
                  requestlandpicture.fields['entries'] = jsonEncode(entries);
                  requestlandpicture.fields['check_role'] = "guest";
                  for (int i = 0; i < imageFileList.length; i++) {
                    requestlandpicture.files.add(
                        await http.MultipartFile.fromPath(
                            'fileupload', imageFileList[i].path));
                  }
                  var res = await requestlandpicture.send();
                  if (res.statusCode == 200) {
                    Navigator.pop(context);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            title: Icon(
                              Icons.check_circle_outline,
                              color: Colors.lightGreen.shade400,
                              size: 100,
                            ),
                            content: Text(
                              'Register Success',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            actions: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, "/Profile", (route) => false);
                                  },
                                  child: Text(
                                    'OK',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  style: ButtonStyle(
                                      alignment: Alignment.center,
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              side: BorderSide(
                                                  color:
                                                      Colors.grey.shade300)))),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                } catch (e) {
                  Navigator.pop(context);
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (BuildContext) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                          ),
                          title: Icon(
                            Icons.error_outline_outlined,
                            color: Colors.red.shade400,
                            size: 70,
                          ),
                          content: Text(
                            'connection down',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    alignment: Alignment.center,
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            side: BorderSide(
                                                color: Colors.grey.shade300)))),
                              ),
                            ),
                          ],
                        );
                      });
                }
              }
            }
          }

          // print(_imageFileList);
          //Navigator.pop(context, entries);
          // print(entries);

        } else {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  title: Icon(
                    Icons.error_outline_outlined,
                    color: Colors.red.shade400,
                    size: 70,
                  ),
                  content: Text(
                    'Please complete the information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            alignment: Alignment.center,
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: Colors.grey.shade300)))),
                      ),
                    ),
                  ],
                );
              });
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    val = 'Square Centimeter';

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
                  check_role_profile == "guest" ? 'Next' : 'Save',
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
                          value: val,
                          items: createDD(),
                          onChanged: (String? newvalue) {
                            setState(() {
                              val = newvalue!;
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
                    child: imageFileList.length == 0
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
                      itemCount: imageFileList.length,
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
                                    imageFileList[index].path,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                right: -10,
                                top: -10,
                                child: IconButton(
                                  onPressed: () {
                                    imageFileList.removeAt(index);
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
                child: imageFileList.length == 0
                    ? Text(
                        '',
                      )
                    : Text(
                        'image = ${imageFileList.length.toString()}',
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
                                    priceTEC.removeAt(index);
                                    plantTEC.removeAt(index);
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
