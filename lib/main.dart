import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/views/auth/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}
