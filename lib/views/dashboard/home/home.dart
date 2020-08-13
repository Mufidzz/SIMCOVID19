import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simcovid19id/views/dashboard/home/action_fitur/actionfitur.dart';
import 'package:simcovid19id/views/dashboard/home/bio/bio.dart';
import 'package:simcovid19id/views/dashboard/home/news_update/newsupdate.dart';
import 'package:simcovid19id/views/dashboard/home/persebaran_covid19/persebarancovid19.dart';
import 'package:simcovid19id/providers/userProvider.dart';

import '../../../providers/newsProvider.dart';
import '../../../providers/newsProvider.dart';
import '../../../providers/newsProvider.dart';
import '../../../providers/userProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String id;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id = preferences.getString("IDUser");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          color: Colors.red,
          child: FutureBuilder(
            future: Future.wait([
              Provider.of<UserProvider>(context, listen: false).fetchUser(id),
              Provider.of<NewsProvider>(context, listen: false).fetchNews()
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer2<UserProvider, NewsProvider>(
                builder: (context, dataUser, dataNews, _) {
                  return SafeArea(
                    child: Material(
                      color: Color(0xFFF5F5F5),
                      child: CustomScrollView(
                        slivers: [
                          SliverPersistentHeader(
                            delegate: MySliverAppBar(
                                expandedHeight: 240,
                                username: dataUser.userModel.data.username,
                                asal: dataUser.userModel.data.alamat),
                            pinned: true,
                          ),
                          SliverToBoxAdapter(
                            child: NewsUpdate(
                              newsitem: dataNews.newsModel.data,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: PersebaranCovid19(),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _onRefresh() async {
    Provider.of<UserProvider>(context, listen: false).fetchUser(id);
    Provider.of<NewsProvider>(context, listen: false).fetchNews();
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String username, asal;

  MySliverAppBar(
      {@required this.expandedHeight,
      @required this.username,
      @required this.asal});

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
                  shrinkOffset: shrinkOffset,
                  expandedHeight: expandedHeight,
                  username: username,
                  asal: asal,
                ),
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
