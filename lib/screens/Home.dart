import 'package:blood_donors/screens/Profile.dart';
import 'package:blood_donors/screens/Settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Request.dart';
import 'Dashboard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Dashboard(),
    Request(),
    Profile(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color(0xFFD80032),
            child: Icon(Icons.add,size: 35,),
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Dashboard(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                       Icon(FontAwesomeIcons.search, color: currentTab == 0 ? Colors.red : Colors.grey,size: 25,),
                        SizedBox(height: 7),

                        Text(
                          'Find donors',
                          textAlign:TextAlign.center ,
                          style: TextStyle(
                              color: currentTab == 0 ? Colors.red : Colors.grey, fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {

                        currentScreen =
                            Request();
                        currentTab = 1;
                      });
                    },

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.clipboard, size: 25,color: currentTab == 1 ? Colors.red : Colors.grey,),
                        SizedBox(height: 7),

                        Text(
                          'Request',
                          textAlign:TextAlign.center ,

                          style: TextStyle(
                              color: currentTab == 1 ? Colors.red : Colors.grey, fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Profile(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.history,color: currentTab == 2 ? Colors.red : Colors.grey,size: 25,),
                        SizedBox(height: 7),

                        Text(
                          'history',
                          textAlign:TextAlign.center ,
                          style: TextStyle(
                              color: currentTab == 2 ? Colors.red : Colors.grey, fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 90,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Settings(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[


                        Icon(FontAwesomeIcons.user,color: currentTab == 3 ? Colors.red : Colors.grey,size: 25,),
                        SizedBox(height: 7),
                        Text(
                          'profile',
                          textAlign:TextAlign.center ,
                          style: TextStyle(
                              color: currentTab == 3 ? Colors.red : Colors.grey, fontSize: 11.0,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
