import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalkThrough extends StatefulWidget {
  @override
  _WalkThrough createState() => _WalkThrough();
}

class _PhoneNumber extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Align(
          alignment: Alignment.topRight,
          child: SizedBox(
          ),
        ),
      ),
    );
  }
}

class _ChooseBloodType extends StatelessWidget
{
  final String bloodType = 'A-';
  Widget build(BuildContext context)
  {
    return Scaffold(
        backgroundColor: Color(0xFFF6F7FC),
        body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image(
                  image: AssetImage(
                    'assets/images/logo-red.png',
                  ),
                  height: 44.0,
                  width: 285.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: SizedBox(
                    width: 62.0,
                    height: 2.0,
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Color(0xFFDB231D),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: SizedBox(
                    width: 309.0,
                    height: 400.0,
                    child: Container(
                      decoration: new BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: Row(
                        children: <Widget> [
                          Expanded(
                            flex: 2,
                            child: Material(
                              child: InkWell(
                                onTap: ()
                                {

                                },
                                child: Container(
                                  child: ClipRRect(
                                    child: Image.asset('assets/images/left-arrow.png',
                                        width: 30.0, height: 47.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                          flex: 5,
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget> [
                                Image(
                                  image: AssetImage(
                                    'assets/images/blood-type.png',
                                  ),
                                  height: 44.0,
                                  width: 285.0,
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:30.0),
                                    child:
                                    Text(bloodType, style: TextStyle(color: Color(0xFFDB231D), fontSize: 40, fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Material(
                              child: InkWell(
                                onTap: ()
                                {

                                },
                                child: Container(
                                  child: ClipRRect(
                                    child: Image.asset('assets/images/right-arrow.png',
                                        width: 30.0, height: 47.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: ButtonTheme(
                    minWidth: 169,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: RaisedButton(
                      onPressed: ()
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => _ChooseBloodType()
                          ),
                        );
                      },
                      color: Color(0xffDB231D),
                      child: Text('Continue', style: TextStyle(color: Colors.white, fontSize: 18,),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}

class _ChooseLogin extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
        body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
                child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height/2.0,
                        child: Container(
                          decoration: new BoxDecoration(
                            color: Color(0xffDB231D),
                            borderRadius: new BorderRadius.only(
                              bottomRight: const Radius.circular(34.0),
                              bottomLeft: const Radius.circular(34.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 70,width: 375),
                      ButtonTheme(
                        minWidth: 288,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: RaisedButton(
                          onPressed: ()
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => _PhoneNumber()
                              ),
                            );
                          },
                          color: Color(0xffDB231D),
                          child: Text('Login with Phone Number', style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:15.0),
                        child: ButtonTheme(
                          minWidth: 288,
                          height: 50,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: RaisedButton(
                            onPressed: (){},
                            color: Color(0xff2A86F3),
                            child: Text('Login with Facebook', style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: const Text('By continuing, you agree to Terms & Conditions', style: TextStyle(color: Color(0xff898A8F),fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: SizedBox(
                          height: 4.0,
                          width: 112.0,
                          child: Container(
                              decoration: new BoxDecoration(
                                color: Color(0xFFE4E4E4),
                                borderRadius: BorderRadius.circular(4.0),
                              )
                          ),
                        ),
                      ),
                    ]
                )
            ),
          ),
        ]
      ),
    );
  }
}

class _WalkThrough extends State<WalkThrough> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 7.0),
      height: 15.0,
      width: 15.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFFDB231D) : Color(0xFFE4E4E4),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 550.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 30.0),
                            Center(
                              child:
                              Image(
                                image: AssetImage(
                                  'assets/images/walkthrough1.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'YOU\'RE A HERO!',
                              style: TextStyle(color: Color(0xffDB231D), fontSize: 20.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'A life may depend on a gesture from you.',
                              style: TextStyle(color: Color(0xffE4E4E4), fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/walkthrough2.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'IDENTIFY YOUR BLOOD',
                              style: TextStyle(color: Color(0xffDB231D), fontSize: 20.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Your blood type now matters',
                              style: TextStyle(color: Color(0xffE4E4E4), fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/walkthrough3.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'DONATE TO OTHERS',
                              style: TextStyle(color: Color(0xffDB231D), fontSize: 20.0),
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Donate to individual cases in one step',
                              style: TextStyle(color: Color(0xffE4E4E4), fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                Expanded(
                  child: Align(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 340.0,
                            height: 55.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: RaisedButton(
                              onPressed: ()
                              {
                                if(_currentPage != _numPages - 1) {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                }
                                else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _ChooseLogin()
                                    ),
                                  );
                                }
                              },
                              color: Color(0xffDB231D),
                              elevation: 0.0,
                              textColor: Colors.white,
                              child: const Text('NEXT', style: TextStyle(fontSize: 17)),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          SizedBox(
                            height: 4.0,
                            width: 112.0,
                            child: Container(
                              decoration: new BoxDecoration(
                                  color: Color(0xFFE4E4E4),
                                borderRadius: BorderRadius.circular(4.0),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

