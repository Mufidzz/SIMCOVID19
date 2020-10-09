import 'package:flutter/material.dart';
import 'package:simcovid19id/views/allmenu/allmenu.dart';
import 'package:simcovid19id/views/education/educationcategory.dart';
import 'package:simcovid19id/views/news/all_news/allnews.dart';
import 'package:simcovid19id/views/protocol/protokol.dart';
import '../../../qna/qna.dart';

class ActionFitur extends StatelessWidget {
  final double shrinkOffset, expandedHeight;

  ActionFitur(
      {Key key, @required this.shrinkOffset, @required this.expandedHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (1 - shrinkOffset / expandedHeight),
      child: Card(
        elevation: 10,
        child: SizedBox(
          height: expandedHeight - 150,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AllNews(),
                          ),
                        );
                      },
                      child: Container(
                        width: 63,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.event_note,
                              color: Color(0xFFF5E837),
                              size: 40,
                            ),
                            Text(
                              'Berita',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFF9AC),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProtocolView(),
                          ),
                        );
                      },
                      child: Container(
                        width: 63,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.assignment_turned_in,
                              color: Color(0xFFDB4C2A),
                              size: 40,
                            ),
                            Text(
                              'Protokol',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFFBCAC),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EducationsCategory(),
                          ),
                        );
                      },
                      child: Container(
                        width: 63,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.import_contacts,
                              color: Color(0xFF55CED3),
                              size: 40,
                            ),
                            Text(
                              'Edukasi',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFACFCFF),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => QnaView(),
                          ),
                        );
                      },
                      child: Container(
                        width: 63,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.forum,
                              color: Color(0xFF64D83A),
                              size: 40,
                            ),
                            Text(
                              'QnA',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFC2FFAC),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AllMenu(),
                          ),
                        );
                      },
                      child: Container(
                        width: 63,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.apps,
                              color: Color(0xFF586BCE),
                              size: 40,
                            ),
                            Text(
                              'Lainnya',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFACB9FF),
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
    );
  }
}
