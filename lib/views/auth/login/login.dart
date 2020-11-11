import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/providers/authProvider.dart';
import 'package:simcovid19id/views/auth/register/register.dart';
import 'package:simcovid19id/views/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool _isHidePassword = true;
bool _rememberMe = false;
bool _load = false;

class _LoginState extends State<Login> {
  final _username = new TextEditingController();
  final _password = new TextEditingController();

  @override
  void initState() {
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF34324B),
        body: Stack(
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
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        child: Text(
                          'Masuk Akun Saya',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xFFC5F0CB),
                          ),
                        ),
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        'Email',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: TextField(
                          controller: _username,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Kata Sandi',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        padding: EdgeInsets.only(left: 8, right: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _password,
                                obscureText: _isHidePassword,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                            GestureDetector(
                              onTap: _tooglePasswordVisibility,
                              child: Container(
                                width: 30,
                                height: double.infinity,
                                child: Icon(
                                  _isHidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black26,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                value: _rememberMe,
                                activeColor: Color(0xFFBFE9C6),
                                onChanged: (bool value) {
                                  setState(
                                    () {
                                      _rememberMe = value;
                                    },
                                  );
                                },
                              ),
                            ),
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Ingat Saya',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      RaisedButton(
                        onPressed: () {
                          auth(context);
                        },
                        color: Color(0xFFBFE9C6),
                        child: Container(
                          width: double.infinity,
                          height: 45,
                          child: Center(
                            child: Text(
                              'Masuk',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Belum memiliki akun? ',
                            style: TextStyle(color: Colors.white),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(
                                  builder: (BuildContext context) => Register(),
                                ),
                              );
                            },
                            child: Text(
                              'Daftar',
                              style: TextStyle(
                                color: Color(0xFFBFE9C6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tooglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  void auth(BuildContext context) async {
    final authState = Provider.of<AuthProvider>(context, listen: false);

    if (_username.text.isNotEmpty) {
      if (_password.text.isNotEmpty) {
        authState.auth(_username.text, _password.text).then(
          (value) {
            if (value != null && value.data.userData.id > 0) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => Dashboard(),
                ),
              );
              savePrefString("IDUser", value.data.userData.id.toString());
              if (_rememberMe) {
                savePrefBoolean('logged', true);
              }
            } else {
              showToast("Akun Anda Belum Terdaftar", context);
            }
          },
        );
      } else {
        showToast("Password tidak boleh kosong", context);
      }
    } else {
      showToast("Email tidak boleh kosong", context);
    }
  }

  showToast(String message, var context) {
    Toast.show(message, context, duration: Toast.LENGTH_LONG);
  }

  savePrefBoolean(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setBool(key, value);
    });
  }

  savePrefString(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString(key, value);
    });
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getBool("status") != null) {
        _rememberMe = preferences.getBool("status");
        print(_rememberMe);
      }
    });
  }
}
