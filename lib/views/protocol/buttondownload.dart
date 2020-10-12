
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:simcovid19id/views/protocol/protokol.dart';

typedef downloadCallback = Future<void> Function (String downloadUrl, String title);

class ButtonDownload extends StatefulWidget {
  String downloadUrl;
  String title;
  final downloadCallback;

  ButtonDownload({@required this.downloadUrl, @required this.title, @required this.downloadCallback});

  @override
  _ButtonDownloadState createState() => _ButtonDownloadState(downloadUrl: downloadUrl, title: title, downloadCallback: downloadCallback);
}

class _ButtonDownloadState extends State<ButtonDownload> {
  String downloadUrl;
  String title;
  final downloadCallback;

  _ButtonDownloadState({@required this.downloadUrl, @required this.title, @required this.downloadCallback});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
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
            downloadCallback(downloadUrl, title);
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
    );
  }

}
