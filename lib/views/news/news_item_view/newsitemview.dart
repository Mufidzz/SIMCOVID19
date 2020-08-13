import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/News.dart';

import '../../../config/globalConfig.dart';

class NewsItemView extends StatefulWidget {
  Datum newsItem;
  String date;

  NewsItemView({this.newsItem, this.date});

  @override
  _NewsItemViewState createState() => _NewsItemViewState(newsItem: newsItem, date: date);
}

class _NewsItemViewState extends State<NewsItemView> {
  Datum newsItem;
  String date;

  _NewsItemViewState({this.newsItem, this.date});

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
              BgAtas(title: 'Berita COVID-19'),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 16, left: 12, right: 12),
                child: Column(
                  children: <Widget>[
                    //title
                    Text(
                      newsItem.title,
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
                                CONFIG.NEWS_IMG_URL + newsItem.image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      newsItem.description,
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
