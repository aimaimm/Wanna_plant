import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/profile/cartScreen.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isVisible = true;
    bool identify = true;
    bool planter = true;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            width: 50,
            margin: EdgeInsets.only(right: 5, top: 3),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => cartScreen(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart_outlined,
                  size: 25, color: Colors.black),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border(
                left: BorderSide(color: Colors.grey.shade300),
                right: BorderSide(color: Colors.grey.shade300),
                top: BorderSide(color: Colors.grey.shade300),
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // fit: BoxFit.scaleDown,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  'assets/images/man-square.jpg',
                                  width: 95,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'John John',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Now you\'re customer',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: size.height * 0.05,
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: identify == false
                                    ? Colors.red.shade100
                                    : Colors.greenAccent.shade100,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                      identify == false
                                          ? Icons.close
                                          : Icons.done_all,
                                      color: Colors.grey.shade700),
                                  Text(
                                    identify == false
                                        ? 'Unsuccess for Identify'
                                        : 'Success for Identify',
                                    style:
                                        TextStyle(color: Colors.grey.shade700),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        "Rating",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 16.0, left: 16.0),
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          left: BorderSide(
                                              color: Colors.grey, width: 0.5),
                                          right: BorderSide(
                                              color: Colors.grey, width: 0.5),
                                          top: BorderSide(
                                              color: Colors.grey, width: 0.5),
                                          bottom: BorderSide(
                                              color: Colors.grey, width: 0.5),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '0',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Text(
                                        "Planted",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: isVisible,
                          child: Text(
                            'Photos',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Visibility(
                            visible: isVisible,
                            child: Container(
                              width: size.width,
                              height: 141,
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        'assets/images/flowers-1.jpg',
                                        width: 130,
                                        height: 130,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width,
                    child: Text(
                      'About',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.14,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.grey.shade100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.account_circle,
                                      color: Colors.grey.shade600),
                                  label: Text(
                                    'Manage Account',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                  style: ButtonStyle(
                                      alignment: Alignment.centerLeft),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey.shade400,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.history,
                                    color: Colors.grey.shade600,
                                  ),
                                  label: Text(
                                    'History',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                  style: ButtonStyle(
                                      alignment: Alignment.centerLeft),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  planter == true
                                      ? Icons.check_circle_outline
                                      : Icons.terrain,
                                  color: planter == true
                                      ? Colors.lightGreen.shade400
                                      : Colors.grey.shade600,
                                ),
                                label: Text(
                                  planter == true
                                      ? 'Now, You be are planter and customer'
                                      : 'Register to be planter',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.phone_outlined,
                                  color: Colors.grey.shade600,
                                ),
                                label: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.logout_outlined,
                                  color: Colors.grey.shade600,
                                ),
                                label: Text(
                                  'Log Out',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
