import 'package:flutter/material.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';

class AllMenu extends StatefulWidget {
  @override
  _AllMenuState createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            BgAtas(title: "Semua Menu",),
          ],
        ),
      ),
    );
  }
}
