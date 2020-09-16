import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color primary = Color(0xFFDB231D);

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => new _SignUp();
}

class _SignUp extends State<SignUp>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    child: Text('New Account', style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:18.0, left: 20.0, right: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
                        child: Text(
                          'First Name',
                          style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
                        child: Text(
                          'First Name',
                          style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:60.0, left: 20.0, right: 20),
            child: ButtonTheme(
              minWidth: 1000,
              height: 57.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: ()
                      {

                      },
                      color: primary,
                      elevation: 0.0,
                      textColor: Colors.white,
                      child: const Text('Create Account', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
