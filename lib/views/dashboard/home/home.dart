import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/CovidProvinsi.dart';
import 'package:simcovid19id/providers/covidProvider.dart';
import 'package:simcovid19id/providers/newsProvider.dart';
import 'package:simcovid19id/views/dashboard/home/action_fitur/actionfitur.dart';
import 'package:simcovid19id/views/dashboard/home/bio/bio.dart';
import 'package:simcovid19id/views/dashboard/home/news_update/newsupdate.dart';
import 'package:simcovid19id/views/dashboard/home/persebaran_covid19/persebarancovid19.dart';

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
//    getPref();
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
//              Provider.of<UserProvider>(context, listen: false).fetchUser(id),
              Provider.of<NewsProvider>(context, listen: false)
                  .fetchNewsLimit(CONFIG.API_TOKEN),
              Provider.of<CovidProvider>(context, listen: false)
                  .fetchCovidNasional(),
              Provider.of<CovidProvider>(context, listen: false)
                  .fetchCovidProvinsi()
            ]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Consumer3<NewsProvider, CovidProvider, CovidProvider>(
                builder: (context, dataNewsLimit, dataCovidNasional,
                    dataCovidProvinsi, _) {
                  var dataChart = getDataChart(dataCovidNasional);
                  var rataRata = getRataRata(dataChart).toStringAsFixed(2);
                  var dataMap = getDataProv(dataCovidProvinsi);

                  return SafeArea(
                    child: Material(
                      color: Color(0xFFF5F5F5),
                      child: CustomScrollView(
                        slivers: [
                          SliverPersistentHeader(
                            delegate: MySliverAppBar(
                                hari: dataCovidNasional
                                    .covidNasionalModel.update.harian.length,
                                expandedHeight: 240,
                                username: "XXX",
                                asal: "XXX"),
                            pinned: true,
                          ),
                          SliverToBoxAdapter(
                            child: NewsUpdate(
                              newsitem: dataNewsLimit.newsModelLimit.data,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: PersebaranCovid19(
                              dataPie: dataMap,
                              rataRata: rataRata,
                              dataChart: dataChart,
                              update:
                                  dataCovidNasional.covidNasionalModel.update,
                              datum:
                                  dataCovidProvinsi.covidProvinsiModel.listData,
                              data: dataCovidNasional.covidNasionalModel,
                            ),
                          ),
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
//    Provider.of<UserProvider>(context, listen: false).fetchUser(id);
    Provider.of<NewsProvider>(context, listen: false)
        .fetchNewsLimit(CONFIG.API_TOKEN);
    Provider.of<CovidProvider>(context, listen: false).fetchCovidNasional();
    Provider.of<CovidProvider>(context, listen: false).fetchCovidProvinsi();
  }

  List<double> getDataChart(CovidProvider dataCovidNasional) {
    List<double> dataChart = List<double>();
    for (int i = 0;
        i < dataCovidNasional.covidNasionalModel.update.harian.length;
        i++) {
      dataChart.add(dataCovidNasional
          .covidNasionalModel.update.harian[i].jumlahPositif.value
          .toDouble());
    }
    return dataChart;
  }

  double getRataRata(List<double> dataChart) {
    var diff =
        dataChart[dataChart.length - 1] - dataChart[dataChart.length - 2];
    var persentase = (diff / dataChart[dataChart.length - 2]) * 100;

    return persentase;
  }

  Map<String, double> getDataProv(CovidProvider dataCovidProvinsi) {
    Map<KelompokUmurKey, double> data = new Map();
    Map<String, double> dataPie = new Map();

    var kelompok_umur =
        dataCovidProvinsi.covidProvinsiModel.listData[1].kelompokUmur;
    kelompok_umur.forEach((element) {
      data.putIfAbsent(element.key, () => element.docCount.toDouble());
    });

    data.forEach((key, value) {
      String keyPie = kelompokUmurKeyValues.reverse[key];
      dataPie.putIfAbsent("$keyPie thn", () => value);
    });

    return dataPie;
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String username, asal;
  final int hari;

  MySliverAppBar(
      {@required this.expandedHeight,
      @required this.username,
      @required this.asal,
      @required this.hari});

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
                  hari: hari,
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
