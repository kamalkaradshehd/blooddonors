import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_list_pick/country_list_pick.dart';

Color primary = Color(0xFFDB231D);

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumber createState() => _PhoneNumber();
}

class _PhoneNumber extends State<PhoneNumber> {

  final phoneNumberController = TextEditingController();
  String countryCode = '+962';
  String _verificationId;

  FirebaseUser _firebaseUser;
  AuthCredential _phoneAuthCredential;

  Future<void> _login() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential)
          .then((AuthResult authRes) {
        _firebaseUser = authRes.user;
        print(_firebaseUser.toString());
      });
      print('theeb');
    } catch (e) {
      print('kos ammak');
    }
  }

  Future<void> _submitPhoneNumber() async
  {
    String mobileNumber = phoneNumberController.text.toString().trim();
    if(mobileNumber[0] == '0') mobileNumber.substring(1);
    String phoneNumber = countryCode + mobileNumber;
    print(phoneNumber);
    void verificationCompleted(AuthCredential phoneAuthCredential) {
      this._phoneAuthCredential = phoneAuthCredential;
      print(phoneAuthCredential);
    }

    void verificationFailed(AuthException error) {
    }

    void codeSent(String verificationId, [int code])
    {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OTP(),
          ),
      );
    }

    void codeAutoRetrievalTimeout(String verificationId) {

    }

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(milliseconds: 10000),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); // All the callbacks are above
  }
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
              child: SizedBox(
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30.0, left: 20.0, right: 20),
            child: Text(
              'Welcome Back!',
              style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 15.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
            child: Text(
              'Login!',
              style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 20.0,
                color: primary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0, left: 20.0, right: 20),
            child: Text(
              'Enter Mobile Number',
              style: TextStyle(fontWeight: FontWeight.w600,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:18.0, left: 20.0, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11.0),
                border: Border.all(color: Color(0xFFDDDEE0), width: 2)
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0,
                    top: 3.0,
                    bottom: 3.0,
                ),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      flex: 2,
                      child: CountryListPick(
                        isShowFlag: true,
                        isShowTitle: false,
                        isShowCode: false,
                        isDownIcon: true,
                        initialSelection: '+962',
                        showEnglishName: true,
                        onChanged: (CountryCode code) {
                          countryCode = code.code.toString();
                          print(code.name);
                          print(code.code);
                          print(code.dialCode);
                          print(code.flagUri);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: phoneNumberController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: '(777) 963123'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:40.0, left: 20.0, right: 20),
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
                        _submitPhoneNumber();
                      },
                      color: primary,
                      elevation: 0.0,
                      textColor: Colors.white,
                      child: const Text('SEND CODE', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0, left: 25.0, right: 20),
            child: Row(
              children: <Widget>[
                Text('By Proceeding, you agree to Blood Donors ',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF858585)),
                  ),
                Text('Terms & Conditions',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: primary),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OTP extends StatefulWidget {
  @override
  _OTP createState() => _OTP();
}

class _OTP extends State<OTP>
{
  final digitOneController = TextEditingController();
  final digitTwoController = TextEditingController();
  final digitThreeController = TextEditingController();
  final digitFourController = TextEditingController();
  final digitFiveController = TextEditingController();
  final digitSixController = TextEditingController();

  void _submitOTP(String smsCode)
  {
    _PhoneNumber()._phoneAuthCredential = PhoneAuthProvider.getCredential(
        verificationId: _PhoneNumber()._verificationId, smsCode: smsCode);
    _PhoneNumber()._login();
  }

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
                    child: Text(
                      'Verify Mobile Number!',
                      style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:70.0, left: 20.0, right: 20),
            child: Text(
              'We have sent a verification code to your Phone number "0777304122"!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF858585), fontWeight: FontWeight.w600,
                fontSize: 17.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:40.0, left: 30.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      controller: digitOneController,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        counterText: "",
                        hintText: "0",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      controller: digitTwoController,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        counterText: "",
                        hintText: "0",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      controller: digitThreeController,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        counterText: "",
                        hintText: "0",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      controller: digitFourController,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        counterText: "",
                        hintText: "0",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      controller: digitFiveController,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        counterText: "",
                        hintText: "0",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: digitSixController,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(1),
                      ],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        counterText: "",
                        hintText: "0",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0, left: 30.0, right: 30.0),
            child: new InkWell(
                child: new Text('Resend Code', style: TextStyle(color: primary, fontWeight: FontWeight.bold),
                ),
                onTap: ()
                {

                }
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
                        String smsCode = digitOneController.text.toString().trim() + digitTwoController.text.toString().trim()
                            + digitThreeController.text.toString().trim() + digitFourController.text.toString().trim()
                            + digitFiveController.text.toString().trim() + digitSixController.text.toString().trim();
                        _submitOTP(smsCode);
                      },
                      color: primary,
                      elevation: 0.0,
                      textColor: Colors.white,
                      child: const Text('VERIFY', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)
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