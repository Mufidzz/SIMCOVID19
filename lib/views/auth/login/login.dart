import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/views/auth/register/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool _isHidePassword = true;

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF262C76),
    ));
    return Scaffold(
      backgroundColor: Color(0xFF262C76),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40, top: 22, bottom: 22),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  width: 160,
                  height: 160,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage('assets/images/logo.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 24,
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
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
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
                          size: 22,
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
                  height: 24,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
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
                            obscureText: _isHidePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _tooglePasswordVisibility,
                        child: Container(
                          width: 50,
                          height: double.infinity,
                          child: Icon(
                            _isHidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 55,
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40),
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    color: Color(0xffF56E07),
                    onPressed: () {
                      print('Masuk');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      'MASUK',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Belum punya akun? ',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Register(),
                          ),
                        );
                      },
                      child: Text(
                        'Daftar',
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tooglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
}
