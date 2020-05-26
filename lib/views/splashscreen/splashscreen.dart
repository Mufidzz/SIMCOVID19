import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../auth/login/login.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (BuildContext context) => Login(),
    )));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF34324B),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/coronaVirus.png'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: RichText(
                text: TextSpan(
                  text: 'SIM',
                  style: TextStyle(color: Color(0xFFC5F0CB),
                      fontSize: 25,
                      fontFamily: 'Avenir'),
                  children: <TextSpan>[
                    TextSpan(text: 'COVID19ID',
                        style: TextStyle(color: Color(0xFFFFFFFF),
                            fontSize: 25,
                            fontFamily: 'Avenir'))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}