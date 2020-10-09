import 'package:flutter/material.dart';
import 'package:simcovid19id/model/CovidNasional.dart';
import 'package:intl/intl.dart';
import 'package:simcovid19id/model/CovidProvinsi.dart';
import 'package:simcovid19id/views/persebaran_covid_nasional/persebarancovidnasional.dart';
import 'package:simcovid19id/views/persebaran_covid_provinsi/persebarancovidprovinsi.dart';

class PersebaranCovid19 extends StatefulWidget {
  Update update;
  List<ListDatum> datum;
  CovidNasional data;
  List<double> dataChart;
  var dataPie;
  var rataRata;

  PersebaranCovid19(
      {Key key,
      @required this.update,
      @required this.datum,
      @required this.data,
      @required this.dataChart,
      @required this.rataRata,
      @required this.dataPie})
      : super(key: key);

  @override
  _PersebaranCovid19State createState() => _PersebaranCovid19State(
      update: update,
      datum: datum,
      data: data,
      dataChart: dataChart,
      rataRata: rataRata,
      dataPie: dataPie);
}

class _PersebaranCovid19State extends State<PersebaranCovid19> {
  CovidNasional data;
  Update update;
  List<ListDatum> datum;
  List<double> dataChart;
  var rataRata;
  var dataPie;

  _PersebaranCovid19State(
      {Key key,
      @required this.update,
      @required this.datum,
      @required this.data,
      @required this.dataChart,
      @required this.rataRata,
      @required this.dataPie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'PERSEBARAN COVID-19',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            DateFormat('d MMMM yyyy').format(update.penambahan.created),
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'NASIONAL',
                style: TextStyle(fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Persebaran(
                        dataCovid: data,
                        data1: dataChart,
                        rataRata: rataRata,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          PersebaranShapeNasional(context, update),
          SizedBox(
            height: 26,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                datum[1].key,
                style: TextStyle(fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PersebaranProvinsi(
                        dataCovid: datum,
                        dataPie: dataPie,
                      ),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          PersebaranShapeProvinsi(context, datum),
          SizedBox(
            height: 26,
          ),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Text(
//                'Kabupaten Buleleng',
//                style: TextStyle(fontSize: 16),
//              ),
//              Icon(
//                Icons.arrow_forward_ios,
//                color: Colors.black,
//                size: 20,
//              ),
//            ],
//          ),
//          SizedBox(
//            height: 12,
//          ),
//          PersebaranShape(context),
        ],
      ),
    );
  }
}

Widget PersebaranShapeNasional(BuildContext context, Update update) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.width / 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF8D6AE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Positif',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                NumberFormat("#,###").format(update.total.jumlahPositif),
                style: TextStyle(color: Color(0xFFF8992B), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+" + update.penambahan.jumlahPositif.toString() + " Kasus",
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFC7F2CD),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Sembuh',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                NumberFormat("#,###").format(update.total.jumlahSembuh),
                style: TextStyle(color: Color(0xFF5AD06D), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+" + update.penambahan.jumlahSembuh.toString() + " Kasus",
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF5C0C0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Meninggal',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                NumberFormat("#,###").format(update.total.jumlahMeninggal),
                style: TextStyle(color: Color(0xFFF82B2B), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+" + update.penambahan.jumlahMeninggal.toString() + " Kasus",
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget PersebaranShapeProvinsi(BuildContext context, List<ListDatum> datum) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.width / 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF8D6AE),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Positif',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                NumberFormat("#,###").format(datum[1].jumlahKasus),
                style: TextStyle(color: Color(0xFFF8992B), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+" + datum[1].penambahan.positif.toString() + " Kasus",
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFC7F2CD),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Sembuh',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                NumberFormat("#,###").format(datum[1].jumlahSembuh),
                style: TextStyle(color: Color(0xFF5AD06D), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+" + datum[1].penambahan.sembuh.toString() + " Kasus",
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 3.5,
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF5C0C0),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Meninggal',
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
              Text(
                NumberFormat("#,###").format(datum[1].jumlahMeninggal),
                style: TextStyle(color: Color(0xFFF82B2B), fontSize: 16),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "+" + datum[1].penambahan.meninggal.toString() + " Kasus",
                style: TextStyle(
                  color: Color(0xFF484848),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
