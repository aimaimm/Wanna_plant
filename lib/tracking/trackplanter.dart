import 'package:flutter/material.dart';
// ignore: unused_import
//import 'package:timelines/timelines.dart';

class TrackPlanter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TrackPlanter();
}

class _TrackPlanter extends State<TrackPlanter> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tracking',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: BackButton(color: Colors.grey[300]),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: 
      Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                ),
              ),
              child: SizedBox(
                height: 50,
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffF0F0F0),
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    // labelText: 'Search',
                    enabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: 420,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 430,
                      height: 650,
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: ListTile(
                                title: Text(
                                  '#01',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                                trailing: Text('12/09/64',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xff848484))),
                              ),
                            ),
                            const Divider(
                              color: Color(0xffE0E0E0),
                              height: 0,
                              thickness: 1,
                              indent: 1,
                              endIndent: 1,
                            ),
                            Container(                            
                              child: Stepper(                             
                                controlsBuilder: (context,
                                    {onStepCancel, onStepContinue}) {
                                  return Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        TextButton(
                                          onPressed: onStepContinue,
                                          child: Container(
                                            width: 120,
                                            alignment: Alignment.center,
                                            child: Text('Confirm'),
                                          ),
                                          style: TextButton.styleFrom(
                                            primary: Colors.black,
                                            backgroundColor: Color(0xffFFB443),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        TextButton(
                                          onPressed: onStepCancel,
                                          child: Container(
                                            width: 120,
                                            alignment: Alignment.center,
                                            child: Text('Cancel'),
                                          ),
                                          style: TextButton.styleFrom(
                                            primary: Colors.black,
                                            backgroundColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                type: StepperType.vertical,
                                currentStep: currentStep,
                                onStepTapped: (int Step) {
                                  setState(() {
                                    currentStep = Step;
                                  });
                                },
                                onStepContinue: () {
                                  currentStep < 5
                                      ? setState(() => currentStep += 1)
                                      : null;
                                },
                                onStepCancel: () {},
                                //Step Tracking 1- 6
                                steps: [                                
                                  Step(                                  
                                      isActive: currentStep >= 0,
                                      state: currentStep == 0
                                          ? StepState.editing
                                          : StepState.complete,
                                      title: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.inventory_outlined,
                                              size: 33,
                                              color: Color(0xff757575),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(12)),
                                            Text(
                                              'Order Confirmed',
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Text('')),
                                  Step(
                                      isActive: currentStep >= 1,
                                      state: currentStep == 1
                                          ? StepState.editing
                                          : currentStep < 1
                                              ? StepState.disabled
                                              : StepState.complete,
                                      title: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.timer_outlined,
                                              size: 33,
                                              color: Color(0xff757575),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(12)),
                                            Text(
                                              'Prepare to plant',
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Text('')),
                                  Step(
                                      isActive: currentStep >= 2,
                                      state: currentStep == 2
                                          ? StepState.editing
                                          : currentStep < 2
                                              ? StepState.disabled
                                              : StepState.complete,
                                      title: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.emoji_people_outlined,
                                              size: 33,
                                              color: Color(0xff757575),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10)),
                                            Text(
                                              'Planting',
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Text('')),
                                  Step(
                                      isActive: currentStep >= 3,
                                      state: currentStep == 3
                                          ? StepState.editing
                                          : currentStep < 3
                                              ? StepState.disabled
                                              : StepState.complete,
                                      title: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.grass_outlined,
                                              size: 33,
                                              color: Color(0xff757575),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10)),
                                            Text(
                                              'Harvest',
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Text('')),
                                  Step(
                                      isActive: currentStep >= 4,
                                      state: currentStep == 4
                                          ? StepState.editing
                                          : currentStep < 4
                                              ? StepState.disabled
                                              : StepState.complete,
                                      title: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.airport_shuttle_outlined,
                                              size: 33,
                                              color: Color(0xff757575),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10)),
                                            Text(
                                              'Delivery',
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Text('')),
                                  Step(
                                      isActive: currentStep >= 5,
                                      state: currentStep == 5
                                          ? StepState.editing
                                          : currentStep < 5
                                              ? StepState.disabled
                                              : StepState.complete,
                                      title: Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons
                                                  .sentiment_very_satisfied_outlined,
                                              size: 33,
                                              color: Color(0xff757575),
                                            ),
                                            Padding(
                                                padding: EdgeInsets.all(10)),
                                            Text(
                                              'Success',
                                              style: (TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      content: Text('')),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0xffE0E0E0),
                              height: 0,
                              thickness: 1,
                              indent: 1,
                              endIndent: 1,
                            ),
                            Container(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'John John',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.account_circle_outlined,
                                    color: Color(0xff606060),
                                    size: 30,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        color: Color(0xFFF3F3F3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        elevation: 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
