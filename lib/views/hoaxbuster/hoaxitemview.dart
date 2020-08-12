import 'package:simcovid19id/config/globalConfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/Hoax.dart';

class HoaxItemView extends StatefulWidget {
  Datum hoaxItem;
  String date;

  HoaxItemView({this.hoaxItem, this.date});

  @override
  _HoaxItemView createState() => _HoaxItemView(hoaxItem: hoaxItem, date: date);
}

class _HoaxItemView extends State<HoaxItemView> {
  Datum hoaxItem;
  String date;

  _HoaxItemView({this.hoaxItem, this.date});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              BgAtas(title: 'Hoax COVID-19'),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 16, left: 12, right: 12),
                child: Column(
                  children: <Widget>[
                    //title
                    Text(
                      hoaxItem.title,
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Color(0xFF484848),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
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
                          date,
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                CONFIG.IMG_URL+'/hoax/'+hoaxItem.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      hoaxItem.description,
                      style: TextStyle(
                          color: Color(0xFF484848),
                          fontSize: 17, height: 1.5
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
