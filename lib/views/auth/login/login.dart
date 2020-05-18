import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF262C76),
    ));
    return Scaffold(
      backgroundColor: Color(0xFF262C76),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 52),
              width: 160,
              height: 160,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: new AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'SIM',
                  style: TextStyle(color: Colors.red, fontSize: 28),
                ),
                Text(
                  'COVID19ID',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 32, right: 32),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white12),
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(28.0),
                    bottomRight: const Radius.circular(28.0),
                    bottomLeft: const Radius.circular(28.0),
                  ),
                  color: Colors.white10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.5,
                          color: Color(0xFF262C76),
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.only(left: 32, right: 32),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white12),
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(28.0),
                    bottomRight: const Radius.circular(28.0),
                    bottomLeft: const Radius.circular(28.0),
                  ),
                  color: Colors.white10),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 1.5,
                          color: Color(0xFF262C76),
                        ),
                      ),
                    ),
                    child: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
