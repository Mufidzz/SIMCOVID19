import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/calendar/calendar.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';

class Agenda extends StatefulWidget {
  @override
  _AgendaState createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    return MaterialApp(
      color: Color(0xFFE9EAE9),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Material(
                child: Column(
              children: <Widget>[
                BgAtas(title: 'Agenda'),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    children: <Widget>[Calendar()],
                  ),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}
