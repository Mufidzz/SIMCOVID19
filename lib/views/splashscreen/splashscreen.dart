import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simcovid19id/views/dashboard/dashboard.dart';
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
    startTimer();
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
                  style: TextStyle(
                      color: Color(0xFFC5F0CB),
                      fontSize: 25,
                      fontFamily: 'Avenir'),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'COVID19ID',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
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

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      navigateUser();
    });
  }

  void navigateUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var status = preferences.getBool('logged') ?? false;

    if (status) {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (BuildContext context) => Dashboard(),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        new MaterialPageRoute(
          builder: (BuildContext context) => Login(),
        ),
      );
    }
  }
}
