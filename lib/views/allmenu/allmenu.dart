import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/views/agenda/agenda.dart';
import 'package:simcovid19id/views/hoaxbuster/hoaxbuster.dart';
import 'package:simcovid19id/views/near_hospital/near_hospital.dart';
import 'package:simcovid19id/views/news/all_news/allnews.dart';
import 'package:simcovid19id/views/qna/qna.dart';

class AllMenu extends StatefulWidget {
  @override
  _AllMenuState createState() => _AllMenuState();
}

class _AllMenuState extends State<AllMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            BgAtas(
              title: "Semua Menu",
            ),
            GridView.count(
              shrinkWrap: true,
              primary: true,
              padding:
                  EdgeInsets.only(top: 16, bottom: 16, left: 22, right: 22),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 5
                      : 3,
              physics: new NeverScrollableScrollPhysics(),
              children: <Widget>[
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        Icons.event_note,
                        size: 45,
                        color: Color(0xFFF5E837),
                      ),
                      'Berita'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AllNews(),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        Icons.assignment_turned_in,
                        size: 45,
                        color: Color(0xFFDB4C2A),
                      ),
                      'Protokol'),
                  onTap: () {},
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        Icons.import_contacts,
                        size: 45,
                        color: Color(0xFF55CED3),
                      ),
                      'Edukasi'),
                  onTap: () {},
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        Icons.forum,
                        size: 45,
                        color: Color(0xFF64D83A),
                      ),
                      'QnA'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Qna(),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          'HOAX',
                          style:
                              TextStyle(color: Color(0xFFF19F12), fontSize: 24),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          'Buster',
                          style:
                              TextStyle(color: Color(0xFF484848), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HoaxBuster(),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        const IconData(0xe800, fontFamily: 'list-rich'),
                        size: 40,
                        color: Color(0xFFC22B2B),
                      ),
                      'Agenda'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Agenda(),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        const IconData(0xe900, fontFamily: 'awesome-hospital'),
                        size: 35,
                        color: Color(0xFF1BE2E9),
                      ),
                      'Daftar\nRS Rujukan'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NearHospital(),
                      ),
                    );
                  },
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        const IconData(0xe900, fontFamily: 'map-courthouse'),
                        size: 45,
                        color: Color(0xFF1FA83A),
                      ),
                      'Regulasi'),
                  onTap: () {},
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        const IconData(0xe900, fontFamily: 'phone-msg'),
                        size: 35,
                        color: Color(0xFFFFCE02),
                      ),
                      'Kontak\nLayanan'),
                  onTap: () {},
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        Icons.person_add,
                        size: 40,
                        color: Color(0xFFE51DCA),
                      ),
                      'Pelaporan\nMandiri'),
                  onTap: () {},
                ),
                GestureDetector(
                  child: ShapeFitur(
                      context,
                      Icon(
                        const IconData(0xe800, fontFamily: 'user-graduate'),
                        size: 40,
                        color: Color(0xFF3CCB9B),
                      ),
                      'Tim Pakar'),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget ShapeFitur(BuildContext context, Icon icon, String title) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        icon,
        SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: TextStyle(color: Color(0xFF484848), fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
