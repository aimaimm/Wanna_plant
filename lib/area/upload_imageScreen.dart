import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wanna_plant/constants.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:image_picker/image_picker.dart';

class Upload_imageScreen extends StatefulWidget {
  const Upload_imageScreen({Key? key}) : super(key: key);

  @override
  _Upload_imageScreenState createState() => _Upload_imageScreenState();
}

class _Upload_imageScreenState extends State<Upload_imageScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFileList = [];
  String files = '';

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
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: sizeW,
              child: TextButton(
                onPressed: () {
                  selectImage();
                },
                child: Text(
                  'Select image',
                  style: TextStyle(fontSize: 12),
                ),
                style: TextButton.styleFrom(
                  primary: gbase,
                  side: BorderSide(color: Colors.grey.shade400, width: 0.3),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: _imageFileList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Stack(fit: StackFit.expand, children: [
                      Image.file(
                        File(_imageFileList[index].path),
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: -5,
                        top: -4,
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
                      )
                    ]),
                  );
                },
              ),
            ),

            // Container(
            //   width: sizeW,
            //   height: sizeH * 0.13,
            //   child: ListView.builder(
            //     physics: BouncingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     itemCount: _imageFileList.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(3.0),
            //         child: Stack(
            //           // clipBehavior: Clip.none,
            //           // fit: StackFit.expand,
            //           children: [
            //             Image.file(
            //               File(
            //                 _imageFileList[index].path,
            //               ),
            //               fit: BoxFit.cover,
            //               // width: 80,
            //               // height: 150,
            //             ),
            //             Positioned(
            //               right: -5,
            //               top: -4,
            //               child: IconButton(
            //                 onPressed: () {
            //                   _imageFileList.removeAt(index);
            //                   setState(() {});
            //                 },
            //                 icon: Icon(
            //                   Icons.do_disturb_on,
            //                   color: Colors.red,
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.pushReplacementNamed(context, '/register',
                arguments: _imageFileList.length.toString());
          });
        },
        backgroundColor: gbase,
        child: Icon(Icons.cloud_upload_outlined),
      ),
    );
  }
}
