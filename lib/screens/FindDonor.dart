import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color primary = Color(0xFFDB231D);

class FindDonor extends StatefulWidget {
  @override
  _FindDonor createState() => new _FindDonor();
}

class _FindDonor extends State<FindDonor> {

  String bloodType = 'O-';
  String location = 'Amman';

  @override
  Widget build(BuildContext context){
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
                      child: Text('Find Donor', style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
              child: Text('Search for blood donors around you ', style: TextStyle(color: Color(0xff767676),fontSize: 13,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
              child: Text('Choose blood group', style: TextStyle(color: Color(0xff767676),fontSize: 13,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'A+');
                        },
                        color: bloodType == 'A+' ? primary : Colors.white,
                        textColor: bloodType == 'A+' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('A+', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'A-');
                        },
                        color: bloodType == 'A-' ? primary : Colors.white,
                        textColor: bloodType == 'A-' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('A-', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'B-');
                        },
                        color: bloodType == 'B-' ? primary : Colors.white,
                        textColor: bloodType == 'B-' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('B-', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'O+');
                        },
                        color: bloodType == 'O+' ? primary : Colors.white,
                        textColor: bloodType == 'O+' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('O+', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'O-');
                        },
                        color: bloodType == 'O-' ? primary : Colors.white,
                        textColor: bloodType == 'O-' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('O-', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'AB+');
                        },
                        color: bloodType == 'AB+' ? primary : Colors.white,
                        textColor: bloodType == 'AB+' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('AB+', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'B+');
                        },
                        color: bloodType == 'B+' ? primary : Colors.white,
                        textColor: bloodType == 'B+' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('B+', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: ()
                        {
                          setState(() => bloodType = 'AB-');
                        },
                        color: bloodType == 'AB-' ? primary : Colors.white,
                        textColor: bloodType == 'AB-' ? Colors.white : Colors.black,
                        elevation: 0.0,
                        child: const Text('AB-', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: RaisedButton(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onPressed: null,
                        color: Color(0xFFBFBFC0),
                        elevation: 0.0,
                        textColor: Color(0xFFBFBFC0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
              child: Text('Location', style: TextStyle(color: Color(0xff767676),fontSize: 13,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
                    border: Border.all(color: Color(0xFFDDDEE0), width: 2)
                ),
                padding: const EdgeInsets.only(
                  left: 10.0,
                  top: 3.0,
                  bottom: 3.0,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          value: location,
                          items: [
                            DropdownMenuItem(
                              child: Text("Amman"),
                              value: 'Amman',
                            ),
                            DropdownMenuItem(
                              child: Text("Madaba"),
                              value: 'Madaba',
                            ),
                            DropdownMenuItem(
                                child: Text("Irbid"),
                                value: 'Irbid'
                            ),
                            DropdownMenuItem(
                                child: Text("Zarqa"),
                                value: 'Zarqa'
                            ),
                            DropdownMenuItem(
                                child: Text("Karak"),
                                value: 'Karak'
                            ),
                            DropdownMenuItem(
                                child: Text("Aqaba"),
                                value: 'Aqaba'
                            ),
                            DropdownMenuItem(
                                child: Text("Mafraq"),
                                value: 'Mafraq'
                            ),
                            DropdownMenuItem(
                                child: Text("Tafilah"),
                                value: 'Tafilah'
                            ),
                            DropdownMenuItem(
                                child: Text("Ma'an"),
                                value: 'Ma\'an'
                            ),
                            DropdownMenuItem(
                                child: Text("Ajloun"),
                                value: 'Ajloun'
                            ),
                            DropdownMenuItem(
                                child: Text("Jerash"),
                                value: 'Jerash'
                            ),
                            DropdownMenuItem(
                                child: Text("Al-Salt"),
                                value: 'Al-Salt'
                            ),
                          ],
                          onChanged: (value)
                          {
                            setState(()
                            {
                              location = value;
                            });
                          },
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0, color: Color(0xFF818081)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:50.0, left: 20.0, right: 20),
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
                        child: const Text('Search Donor', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
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
                        color: Color(0xFFFAE2E3),
                        elevation: 0.0,
                        textColor: primary,
                        child: const Text('Emergency Search', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
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
