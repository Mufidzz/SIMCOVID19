import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/Hoax.dart';
import 'package:simcovid19id/providers/hoaxProvider.dart';
import 'package:intl/intl.dart';
import 'package:simcovid19id/views/hoaxbuster/hoaxitemview.dart';

class HoaxBuster extends StatefulWidget {
  @override
  _HoaxBusterState createState() => _HoaxBusterState();
}

class _HoaxBusterState extends State<HoaxBuster> {
  Future<Hoax> futureHoax;
  int _numberMessage = 99;

  @override
  void initState() {
    futureHoax = Provider.of<HoaxProvider>(context, listen: false).fetchHoax();
  }

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
          child: Material(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: BgAtas(title: 'Hoax Buster'),
                      ),
                      Positioned(
                          right: 16,
                          top: 16,
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Icon(
                                Icons.inbox,
                                color: Colors.white,
                                size: 36,
                              ),
                              _numberMessage > 0 ? notif() : Container(),
                            ],
                          )),
                      Positioned.fill(
                        bottom: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Icon(Icons.search)),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.white,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Cari berita hoax'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    child: Text('Berita Hoax Terbaru'),
                  ),
                  FutureBuilder(
                    future: futureHoax,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.data.length == null
                              ? 0
                              : snapshot.data.data.length,
                          itemBuilder: (BuildContext context, index) {
                            var _data = snapshot.data.data.elementAt(index);
                            var _date =
                                DateTime.parse(_data.createdAt.toString());
                            String formatter =
                                new DateFormat('dd MMMM yyyy').format(_date);
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HoaxItemView(
                                      hoaxItem: _data,
                                      date: formatter,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 310,
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: card(_data, formatter),
                                ),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget notif() {
    return ClipOval(
      child: Wrap(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2),
            color: Colors.red,
            child: Text(
              _numberMessage.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget card(Datum data, String formatter) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  data.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  //date news
                  Text(
                    formatter,
                    style: TextStyle(
                      color: Color(0xFF484848),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Text(
                  data.description,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
