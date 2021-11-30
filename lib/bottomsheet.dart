import 'package:flutter/material.dart';
import 'package:wanna_plant/constants.dart';

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(13.0))),
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              //showBotton_sheet = false;
                            });
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                    Container(
                      height: 210,
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            // mainAxisExtent: 28,
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 7),
                          ),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              //  margin: EdgeInsets.symmetric(vertical: 15),
                              margin: EdgeInsets.all(8),
                              //height: 10,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'index $index',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    const Divider(
                      height: 50,
                      thickness: 1,
                    ),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Amount',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {},
                                  icon: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text('-'),
                                  ),
                                ),
                                Text('0'),
                                IconButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {},
                                  icon: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 7,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text('+'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10),
                          ),
                          primary: gbase,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          setState(() {
                            // showBotton_sheet = true;
                          });
                        },
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
