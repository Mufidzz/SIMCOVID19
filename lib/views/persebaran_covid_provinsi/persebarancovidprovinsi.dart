import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/model/CovidProvinsi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersebaranProvinsi extends StatefulWidget {
  List<ListDatum> dataCovid;

  PersebaranProvinsi({@required this.dataCovid});

  @override
  _PersebaranProvinsiState createState() => _PersebaranProvinsiState(dataCovid: dataCovid);
}

class _PersebaranProvinsiState extends State<PersebaranProvinsi> {
  List<ListDatum> dataCovid;

  _PersebaranProvinsiState({@required this.dataCovid});

  @override
  Widget build(BuildContext context) {
    int _jumPositif = dataCovid[1].jumlahKasus;
    int _jumPenambahanPositif = dataCovid[1].penambahan.positif;
    int _jumSembuh = dataCovid[1].jumlahSembuh;
    int _jumPenambahanSembuh = dataCovid[1].penambahan.sembuh;
    int _jumMeninggal = dataCovid[1].jumlahMeninggal;
    int _jumPenambahanMeninggal = dataCovid[1].penambahan.meninggal;
    int _jumLaki = dataCovid[1].jenisKelamin[0].docCount;
    int _jumPerempuan = dataCovid[1].jenisKelamin[1].docCount;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              ListView(
                //todo ganti dengan false
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  BgAtas(title: 'Persebaran Provinsi Covid-19',),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 8),
                    child: Text('Informasi Covid-19 terbaru',
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
                      BoxCovid('Positif', _jumPositif, _jumPenambahanPositif,Color(0xFFF8D6AE), Color(0xFFF8992B)),
                      BoxCovid('Sembuh', _jumSembuh, _jumPenambahanSembuh, Color(0xFFC7F2CD),  Color(0xFF5AD06D)),
                      BoxCovid('Meninggal', _jumMeninggal, _jumPenambahanMeninggal,Color(0xFFF5C0C0),  Color(0xFFF82B2B)),
                      BoxCovid('Penderita', "Laki-Laki", _jumLaki,Color(0xFFAED9F8),  Color(0xFF2BC1F8)),
                      BoxCovid('Penderita', "Perempuan", _jumPerempuan,Color(0xFFC7D3F2),  Color(0xFF5A83D0))

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

  Widget BoxCovid(String judul, var jumlah, int penambahan, var ColorBackground, var ColorContent){
    String tambah = "+$penambahan kasus";
    bool isString =false;
    if(judul == 'PDP' || judul =='ODP'){
      var persentase = jumlah/penambahan*100;
      tambah = "${persentase.toStringAsFixed(2)}%";
    }
    if(judul == 'Sembuh'){
      tambah = "+$penambahan orang";
    }
    if(judul == "Penderita"){
     isString = true;
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
            isString ? jumlah : NumberFormat("#,###").format(jumlah),
            style: TextStyle(color: ColorContent, fontSize: 16),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            isString ? "${NumberFormat("#,###").format(penambahan)} orang":tambah ,
            style: TextStyle(
              color: Color(0xFF484848),
            ),
          ),
        ],
      ),
    );
  }

}
