import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Protokol.dart';
import 'package:simcovid19id/providers/protokolProvider.dart';
import 'package:simcovid19id/views/protocol/protokolitemview.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:open_file/open_file.dart';

class ProtocolView extends StatefulWidget {
  @override
  _ProtocolViewState createState() => _ProtocolViewState();
}

class _ProtocolViewState extends State<ProtocolView> {
  Future<Protokol> futureProtokol;
  var dirDownload = "";
  var progressString = "";
  String _filename = "";
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    var initializationSettingAndroid =
        new AndroidInitializationSettings('logo');
    var initializationSettingIOS = new IOSInitializationSettings();
    var initializationSetting = new InitializationSettings(
        android: initializationSettingAndroid, iOS: initializationSettingIOS);

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onSelectNotification: onSelectNotification);

    futureProtokol = Provider.of<ProtokolProvider>(context, listen: false)
        .fetchProtokol(CONFIG.API_TOKEN);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  BgAtas(title: 'Protokol COVID-19'),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 8),
                    child: Text(
                      'Protokol Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(
                          0xFF484848,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: FutureBuilder<Protokol>(
                      future: futureProtokol,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var _data = snapshot.data.data.elementAt(index);

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProtokolItemView(
                                        protokolItem: _data,
                                      ),
                                    ),
                                  );
                                },
                                child: Card(
                                  margin: EdgeInsets.only(top: 16, bottom: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: 300,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                _data.imageUrl,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          height: 150,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, left: 8, right: 8),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  _data.title,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Color(0xFF484848),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  _data.oldCreatedAt,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Color(0xFF484848),
                                                  ),
                                                ),
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            ),
                                          ),
                                        ),
                                        ButtonTheme(
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18,
                                                right: 18,
                                                bottom: 18,
                                                top: 12),
                                            child: FlatButton(
                                              onPressed: () {
                                                downloadFile(
                                                  _data.downloadUrl,
                                                  _data.title,
                                                );
                                              },
                                              color: Color(0xFFAED9F8),
                                              child: Container(
                                                padding: EdgeInsets.all(16),
                                                child: Text(
                                                  'Unduh Materi',
                                                  style: TextStyle(
                                                      color: Color(0xFF34324B),
                                                      fontSize: 15),
                                                ),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 160),
                  width: MediaQuery.of(context).size.width - 44,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Cari Protokol...',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> downloadFile(String urlPath, String filename) async {
    Dio dio = Dio();

    try {
      var dir = await getExternalStorageDirectory();

      await dio.download(urlPath, "${dir.path}/$filename",
          onReceiveProgress: (rec, total) {
        print("rec : $rec, total : $total");
        setState(() {
          dirDownload = dir.path;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
          Toast.show("Download : $progressString", context,
              gravity: Toast.BOTTOM);
        });
      });

      print('${dir.path}/$filename');
      print("${dir.path}");
      _showNotification(dir.path);
    } catch (e) {
      print(e);
    }
    setState(() {
      progressString = "Completed";
      _filename = filename;
    });
  }

  Future onSelectNotification(String path) async {
    if (progressString == 'Completed') {
      OpenFile.open("$dirDownload/$_filename");
      progressString = '';
    }
  }

  Future _showNotification(String path) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        playSound: false, importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics =
        new IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Unduhan selesai',
      'file : '
          '$path',
      platformChannelSpecifics,
      payload: 'No_Sound',
    );
  }
}
