
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/CovidNasional.dart';

class Persebaran extends StatefulWidget {
  CovidNasional dataCovid;

  Persebaran({@required this.dataCovid});

  @override
  _PersebaranState createState() => _PersebaranState(dataCovid: dataCovid);
}

class _PersebaranState extends State<Persebaran> {
  CovidNasional dataCovid;

  _PersebaranState({@required this.dataCovid});

  @override
  Widget build(BuildContext context) {
    int _jumPostitif = dataCovid.update.total.jumlahPositif;
    int _jumPenambahanPositif = dataCovid.update.penambahan.jumlahPositif;
    int _jumSembuh = dataCovid.update.total.jumlahSembuh;
    int _jumPenambahanSembuh = dataCovid.update.penambahan.jumlahSembuh;
    int _jumMeninggal = dataCovid.update.total.jumlahMeninggal;
    int _jumPenambahanMeninggal = dataCovid.update.penambahan.jumlahMeninggal;
    int _jumPdp = dataCovid.data.jumlahPdp;
    int _jumSpesimen = dataCovid.data.totalSpesimen;
    int _jumOdp = dataCovid.data.jumlahOdp;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[

              ListView(
                //todo ganti false
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  BgAtas(title: 'Persebaran Nasional Covid-19',),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 8),
                    child: Text(
                      'Informasi Covid-10 Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF484848)
                      ),
                    ),
                  ),
                  GridView.count(crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape
                      ? 5
                      : 3,
                    shrinkWrap: true,
                    primary: true,
                    padding:
                    EdgeInsets.only(top: 16, bottom: 16, left: 22, right: 22),
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    physics: new NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      BoxCovid('Positif',_jumPostitif, _jumPenambahanPositif, Color(0xFFF8D6AE),  Color(0xFFF8992B)),
                      BoxCovid('Sembuh',_jumSembuh, _jumPenambahanSembuh, Color(0xFFC7F2CD),  Color(0xFF5AD06D)),
                      BoxCovid('Meninggal',_jumMeninggal, _jumPenambahanMeninggal, Color(0xFFF5C0C0),  Color(0xFFF82B2B)),
                      BoxCovid('PDP',_jumPdp, _jumSpesimen, Color(0xFFAED9F8),  Color(0xFF2BC1F8)),
                      BoxCovid('ODP',_jumOdp, _jumSpesimen, Color(0xFFC7D3F2),  Color(0xFF5A83D0)),
                    ],
                  )
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 160),
                  width: MediaQuery.of(context).size.width - 44,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.search),
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: TextFormField(
                              autofocus: false,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Cari Covid...'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget BoxCovid(String judul, int jumlah, int penambahan, var ColorBackground, var ColorContent){
    String tambah = "+$penambahan kasus";
    if(judul == 'PDP' || judul =='ODP'){
      var persentase = jumlah/penambahan*100;
      tambah = "${persentase.toStringAsFixed(2)}%";
    }
    return  Container(
      width: MediaQuery.of(context).size.width / 3.5,
      padding: EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: ColorBackground,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            judul,
            style: TextStyle(
              color: Color(0xFF484848),
            ),
          ),
          Text(
            NumberFormat("#,###").format(jumlah),
            style: TextStyle(color: ColorContent, fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            tambah,
            style: TextStyle(
              color: Color(0xFF484848),
            ),
          ),
        ],
      ),
    );
  }
}
