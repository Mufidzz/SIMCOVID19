import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/providers/authProvider.dart';
import 'package:simcovid19id/providers/educationProvider.dart';
import 'package:simcovid19id/providers/hoaxProvider.dart';
import 'package:simcovid19id/providers/registerProvider.dart';
import 'package:simcovid19id/providers/userProvider.dart';
import 'package:simcovid19id/providers/newsProvider.dart';
import 'package:simcovid19id/views/auth/login/login.dart';
import 'views/auth/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EducationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HoaxProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Login(),
        ),
      ),
    );
  }
}
