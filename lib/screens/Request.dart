import 'package:blood_donors/screens/PhoneNumber.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget {
  @override
  _Request createState() => _Request();
}

class _Request extends State<Request> {
  List<Widget> Continers = [
    Container(

    ),
    Container(

    ),
  ];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Padding(
              padding: const EdgeInsets.only(top:50.0, left: 20.0, right: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: <Widget> [
                    SizedBox(
                      width: 36.0,
                      height: 36.0,
                      child: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Image(
                            image: AssetImage(
                              'assets/images/back-icon.png',
                            ),
                            height: 13.0,
                            width: 13.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Requests For Blood', style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0, left: 20.0, right: 20),
              child: Text('See received blood requests and also check your requests status',style: TextStyle(color: Color(0xff767676),fontSize: 10,fontWeight: FontWeight.w600),),
            ),
            DefaultTabController(
              length: 2,
              child: TabBar(
                labelColor: Colors.black,
                indicatorColor: primary,
                tabs: <Widget>[
                  Tab(
                    text: "Received Requests",
                  ),
                  Tab(
                    text: "My Requests",
                  ),
                ],
              ),
            ),
            TabBarView(
              children: Continers,
            ),
          ]
        ),
    );
  }
}