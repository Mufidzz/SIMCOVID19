import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:simcovid19id/model/News.dart';
import 'package:intl/intl.dart';

import '../../../../config/globalConfig.dart';
import '../../../../model/News.dart';
import '../../../news/news_item_view/newsitemview.dart';

class NewsUpdate extends StatefulWidget {
  List<Datum> newsitem;

  NewsUpdate({Key key, @required this.newsitem}) : super(key: key);

  @override
  _NewsUpdateState createState() => _NewsUpdateState(newsitem: newsitem);
}

class _NewsUpdateState extends State<NewsUpdate> {
  int _current = 0;
  List<Datum> newsitem;

  _NewsUpdateState({Key key, @required this.newsitem});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Berita Terbaru',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF484848),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Builder(
            builder: (context) {
              return CarouselSlider(
                options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                    // autoPlay: false,
                    ),
                items: newsitem
                    .map((item) => Container(
                          padding: EdgeInsets.all(4),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => NewsItemView(
                                    newsItem: newsitem[_current],
                                    date: DateFormat('d MMMM yyyy')
                                        .format(newsitem[_current].createdAt),
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                CONFIG.NEWS_IMG_URL +
                                                    item.image),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Text(
                                                    item.title,
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xFF484848),
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    DateFormat('d MMMM yyyy')
                                                        .format(item.createdAt),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF484848),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 50,
                                            height: double.infinity,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: newsitem.map(
              (url) {
                int index = newsitem.indexOf(url);
                return Container(
                  width: index == _current ? 12.0 : 6.0,
                  height: index == _current ? 12.0 : 6.0,
                  margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 3.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == _current
                        ? Color(0xFF34324B)
                        : Color(0xFF484848),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
