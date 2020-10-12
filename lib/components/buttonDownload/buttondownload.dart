
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:simcovid19id/views/protocol/protokol.dart';
import 'package:url_launcher/url_launcher.dart';


class ButtonDownload extends StatefulWidget {
  String downloadUrl;

  ButtonDownload({@required this.downloadUrl,});

  @override
  _ButtonDownloadState createState() => _ButtonDownloadState(downloadUrl: downloadUrl, );
}

class _ButtonDownloadState extends State<ButtonDownload> {
  String downloadUrl;

  _ButtonDownloadState({@required this.downloadUrl,});

  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          // onPressed: (){},
          onPressed: () => _launchURL(downloadUrl),
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
