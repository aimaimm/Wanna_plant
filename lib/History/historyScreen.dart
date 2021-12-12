import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wanna_plant/CustomBottomBar.dart';
import 'package:wanna_plant/History/myCard_history.dart';
import 'package:wanna_plant/constants.dart';

import 'package:wanna_plant/favorite/myCard_favorite.dart';
import 'package:http/http.dart' as http;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required this.datauser}) : super(key: key);

  final List datauser;

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

List data_customer = [];
List data_planter = [];
List name_customer = [];
List name_planter = [];
int indexact = 0;

class _HistoryScreenState extends State<HistoryScreen> {
  bool isnull_planter = false;
  bool isnull_customer = false;
  bool syncdata = true;

  Future<void> loaddata() async {
    Uri uri = Uri.http(url, "/getdataactivity");
    Uri uri_dataname = Uri.http(url, "/getnameuser");
    try {
      http.Response response = await http.post(uri, body: {
        'user_id': widget.datauser[0]['user_id'].toString(),
        'check_role': "user",
      });
      if (response.statusCode == 200) {
        // print(response.body);
        List rawdata = jsonDecode(response.body);
        if (rawdata.length != 0) {
          for (int i = 0; i < rawdata.length; i++) {
            if (rawdata[i]['customer'] == widget.datauser[0]['user_id'] &&
                rawdata[i]['status'] == 0) {
              http.Response response_name = await http.post(uri_dataname,
                  body: {
                    'user_id': rawdata[i]['planter'].toString(),
                    'check_role': "user"
                  });
              if (response_name.statusCode == 200) {
                List rawnameplanter = jsonDecode(response_name.body);
                // print(rawnameplanter);
                name_planter.add(rawnameplanter[0]);
                data_customer.add(rawdata[i]);
              } else {
                print(response.body);
                print(response.statusCode);
                break;
              }
            } else if (rawdata[i]['planter'] == widget.datauser[0]['user_id'] &&
                rawdata[i]['status'] == 0) {
              http.Response response_name = await http.post(uri_dataname,
                  body: {
                    'user_id': rawdata[i]['customer'].toString(),
                    'check_role': "user"
                  });
              if (response_name.statusCode == 200) {
                List rawnamecustomer = jsonDecode(response_name.body);
                
                name_customer.add(rawnamecustomer[0]);
                data_planter.add(rawdata[i]);
              } else {
                print(response.body);
                print(response.statusCode);
                break;
              }
            }
          }
        
          setState(() {
            if (data_customer.length == 0) {
              isnull_customer = true;
            }
            if (data_planter.length == 0) {
              isnull_planter = true;
            }
            syncdata = false;
            
          });
        } else {
          setState(() {
            syncdata = false;
            isnull_planter = true;
            isnull_customer = true;
          });
        }
      } else {
        print(response.body);
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      print("connection error");
    }
  }

  @override
  void initState() {
    data_customer.clear();
    data_planter.clear();
    name_customer.clear();
    name_planter.clear();
    indexact = 0;
    loaddata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: loaddata,
      child: DefaultTabController(
        // initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'My Activity',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.black),
            ),
            bottom: TabBar(
              indicatorPadding: EdgeInsets.symmetric(horizontal: 20.0),
              indicatorColor: gbase,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Planter',
                ),
                Tab(
                  text: 'Customer',
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              syncdata
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : isnull_planter
                      ? Center(
                          child: Text('No activity'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              itemCount: data_planter.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    indexact = index;
                                    Navigator.pushNamed(
                                        context, '/History_planter');
                                  },
                                  child: myCard_history(
                                    data: data_planter.length == 1
                                        ? data_planter
                                        : [data_planter[index]],
                                    dataname: name_customer.length == 1
                                        ? name_customer[index]['name']
                                        : name_customer[index]['name'],
                                  ),
                                );
                              }),
                        ),
              syncdata
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : isnull_customer
                      ? Center(
                          child: Text('No activity'),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              itemCount: data_customer.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    indexact = index;
                                    Navigator.pushNamed(
                                        context, '/History_Customer');
                                  },
                                  child: myCard_history(
                                    data: data_customer.length == 1
                                        ? data_customer
                                        : [data_customer[index]],
                                    dataname: name_planter.length == 1
                                        ? name_planter[index]['name']
                                        : name_planter[index]['name'],
                                  ),
                                );
                              }),
                        ),
            ],
          ),
          bottomNavigationBar: CustomBottomBar(),
        ),
      ),
    );
  }
}
