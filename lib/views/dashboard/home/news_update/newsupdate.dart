import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsUpdate extends StatefulWidget {
  @override
  _NewsUpdateState createState() => _NewsUpdateState();
}

final List<String> imgList = [
  'https://covid19.go.id/storage/app/uploads/public/5ec/51f/1d1/5ec51f1d14210773352215.jpeg',
  'https://covid19.go.id/storage/app/uploads/public/5ec/4e6/a5e/5ec4e6a5ee65a809057769.jpeg',
  'https://covid19.go.id/storage/app/uploads/public/5ec/25e/8ec/5ec25e8ecd56a396371415.jpeg',
];

class _NewsUpdateState extends State<NewsUpdate> {
  int _current = 0;

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
                    enableInfiniteScroll: false,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }
                    // autoPlay: false,
                    ),
                items: imageSliders,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map(
              (url) {
                int index = imgList.indexOf(url);
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

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          padding: EdgeInsets.all(4),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(item), fit: BoxFit.cover),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Lorem Ipsum dolor sit amet',
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Color(0xFF484848),
                                  ),
                                ),
                                Text(
                                  '19 Mei 2020',
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
      )
      .toList();
}
