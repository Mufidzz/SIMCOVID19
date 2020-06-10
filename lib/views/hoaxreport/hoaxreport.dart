import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';

class HoaxReport extends StatefulWidget {
  @override
  _HoaxReportState createState() => _HoaxReportState();
}

class _HoaxReportState extends State<HoaxReport> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Avenir'),
      color: Color(0xFFE9EAE9),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Material(
                child: Column(
                  children: <Widget>[
                    BgAtas(title: "Lapor Hoax"),
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
                "Tanggal",
                style: TextStyle(
                  color: Color(0xFF717082),
                  fontSize: 12
                ),
              ),
              Container(
                width: 100,
                height: 25,
                child: TextField(
                  style: TextStyle(
                      color: Color(0xFF717082),
                      fontSize: 12
                  ),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      fillColor: Colors.white),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                width: 300,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Silahkan Isi Data",
                        style: TextStyle(
                            color: Color(0xFF717082),
                            fontSize: 12
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        height: 1,
                        color: Color(0xFF717082),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Judul Laporan*", style: TextStyle(
                          color: Color(0xFF717082),
                          fontSize: 12,
                        ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 285,
                        child: TextField(
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            border: OutlineInputBorder(),
                            hintText: "Masukkan Judul Informasi Dugaan Hoaks...",
                            hintStyle: TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Deskripsi Laporan*", style: TextStyle(
                          color: Color(0xFF717082),
                          fontSize: 12,
                        ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: new ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 300.0,
                          ),
                          child: new Scrollbar(
                            child: new SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              reverse: true,
                              child: new TextField(
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12
                                ),
                                maxLines: null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Deskripsikan Dugaan Informasi Hoaks...",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Sumber", style: TextStyle(
                          color: Color(0xFF717082),
                          fontSize: 12,
                        ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: TextField(
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12
                          ),
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              border: OutlineInputBorder(),
                              hintText: "Masukkan Link Informasi Dugaan Hoaks...",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Tambahkan Foto", style: TextStyle(
                          color: Color(0xFF717082),
                          fontSize: 12,
                        ),
                        ),
                      ),
                      SizedBox(height: 10),
                      RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                        ),
                        label: Text("Add Photo"),
                        color: Colors.white30,
                      ),
                      SizedBox(height: 10),
                      FlatButton(
                          onPressed: () {},
                          color: Colors.blue,
                          child: Text("Kirim", style: TextStyle(color: Colors.white))
                      )
                    ]
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
