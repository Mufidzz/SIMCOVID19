import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/components/bgAtas/special.dart';

import '../dashboard/dashboard.dart';

class SelfReport extends StatefulWidget {
  @override
  _SelfReportState createState() => _SelfReportState();
}
enum SingingCharacter { self, other }
class _SelfReportState extends State<SelfReport> {
  SingingCharacter _character = SingingCharacter.self;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    var _enabled;
    return MaterialApp(
      color: Color(0xFFE9EAE9),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Material(
                child: Column(
                 children: <Widget>[
                  Special(
                    title: "Pelaporan Mandiri",
                    header: "Potensi Tertular Virus Corona",
                  ),
                   Report(context),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
  Widget Report(BuildContext context){
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Kode Tiket",
                style: TextStyle(
                    color: Color(0xFF717082),
                    fontSize: 12,
                    fontFamily: 'Avenir'),
              ),
              Container(
                width: 250,
                height: 25,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                ),
              ),
              Text(
                "Kode Tiket Ref",
                style: TextStyle(
                    color: Color(0xFF717082),
                    fontSize: 12,
                    fontFamily: 'Avenir'),
              ),
              Container(
                width: 250,
                height: 25,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Color(0xFFFFFFFF)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 300,
                height: 630,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 5, top: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Silahkan Isi Data", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: SingingCharacter.self,
                            groupValue: _character,
                            onChanged: (SingingCharacter value){
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          Text(
                              "Lapor Diri Sendiri",style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir')
                          ),
                          Radio(
                            value: SingingCharacter.other,
                            groupValue: _character,
                            onChanged: (SingingCharacter value){
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                          Text(
                              "Lapor Orang Lain",style: TextStyle(
                              color: Color(0xFF717082),
                              fontSize: 12,
                              fontFamily: 'Avenir')
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 1,
                      color: Color(0xFF717082),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama Lengkap", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Alamat Lengkap", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "NIK", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nomor Telepon", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Nama Suspect Yang Menularkan Anda", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Lokasi Bertemu Suspect", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Waktu Bertemu Suspect", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Gejala COVID-19 Yang Anda Alami", style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12,
                            fontFamily: 'Avenir'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5, right: 5),
                      child: Container(
                        width: 285,
                        height: 25,
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              fillColor: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          width: 285,
                          child: FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.only(left: 5, right: 5),
                            splashColor: Colors.blueAccent,
                            onPressed: (){},
                            child: Text(
                                "Kirim", style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 12,
                                fontFamily: 'Avenir')
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

