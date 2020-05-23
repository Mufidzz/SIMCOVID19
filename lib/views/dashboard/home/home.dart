import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/views/dashboard/home/action_fitur/actionfitur.dart';
import 'package:simcovid19id/views/dashboard/home/bio/bio.dart';
import 'package:simcovid19id/views/dashboard/home/news_update/newsupdate.dart';
import 'package:simcovid19id/views/dashboard/home/persebaran_covid19/persebarancovid19.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );

    return SafeArea(
      child: Material(
        color: Color(0xFFF5F5F5),
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 240),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: NewsUpdate(),
            ),
            SliverToBoxAdapter(
              child: PersebaranCovid19(),
            )
          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Container(
          color: Color(0xFF34324B),
          child: Stack(
            children: <Widget>[
              Opacity(
                opacity: (1 - shrinkOffset / expandedHeight),
                child: Align(
                  child: Container(
                    width: 240,
                    height: 240,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/coronaVirus2.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                ),
              ),
              SingleChildScrollView(
                child: Bio(
                    shrinkOffset: shrinkOffset, expandedHeight: expandedHeight),
              ),
            ],
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset + 70,
          left: 8,
          right: 8,
          child: ActionFitur(
              shrinkOffset: shrinkOffset, expandedHeight: expandedHeight),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
