import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/views/auth/login/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

bool _isHidePassword = true;

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {

  }

  void _tooglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }
}
