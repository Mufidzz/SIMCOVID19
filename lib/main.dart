import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/providers/authProvider.dart';
import 'package:simcovid19id/views/auth/login/login.dart';
import 'package:simcovid19id/views/case_map/case_map.dart';
import 'package:simcovid19id/views/dashboard/dashboard.dart';
import 'package:simcovid19id/views/dashboard/home/home.dart';
import 'package:simcovid19id/views/dashboard/user_account/useraccount.dart';

import 'package:simcovid19id/views/education/education.dart';
import 'package:simcovid19id/views/near_hospital/near_hospital.dart';
import 'package:simcovid19id/views/protocol/protocol.dart';
import 'package:simcovid19id/views/regulation/regulation.dart';
import 'components/normalList/normal_list.dart';
import 'views/auth/login/login.dart';
import 'views/dashboard/dashboard.dart';
import 'views/news/all_news/allnews.dart';

import 'views/splashscreen/splashscreen.dart';
import './views/tim_pakar/tim_pakar.dart';
import 'views/service_contact/service_contact.dart';
import 'views/hoaxreport/hoaxreport.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
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
