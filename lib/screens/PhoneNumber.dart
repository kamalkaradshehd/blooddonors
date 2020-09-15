import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumber createState() => _PhoneNumber();
}

class _PhoneNumber extends State<PhoneNumber> {
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(

              ),
            ),
          ],
        ),
      ),
    );
  }
}

