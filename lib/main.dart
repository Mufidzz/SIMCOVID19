import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/providers/authProvider.dart';
import 'package:simcovid19id/providers/covidProvider.dart';
import 'package:simcovid19id/providers/educationProvider.dart';
import 'package:simcovid19id/providers/hoaxProvider.dart';
import 'package:simcovid19id/providers/protokolProvider.dart';
import 'package:simcovid19id/providers/qnaProvider.dart';
import 'package:simcovid19id/providers/registerProvider.dart';
import 'package:simcovid19id/providers/userProvider.dart';
import 'package:simcovid19id/providers/newsProvider.dart';
import 'package:simcovid19id/views/dashboard/dashboard.dart';
import 'package:simcovid19id/views/splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool status;

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
        ),
        ChangeNotifierProvider(
          create: (_) => CovidProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProtokolProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => QnaProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
