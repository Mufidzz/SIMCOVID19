import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';

class NewsItemView extends StatefulWidget {
  @override
  _NewsItemViewState createState() => _NewsItemViewState();
}

class _NewsItemViewState extends State<NewsItemView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              BgAtas(title: 'Berita COVID-19'),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 16, left: 12, right: 12),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Infeksi COVID-19 telah Menyebar di 34 Provinsi di Indonesia, Total Positif Jadi 3.512 Kasus',
                      style: TextStyle(
                        fontSize: 20,
                        height: 1.5,
                        color: Color(0xFF484848),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.access_time,
                          color: Colors.black,
                          size: 20,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          '10 April 2020',
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://covid19.go.id/storage/app/uploads/public/5ec/25e/8ec/5ec25e8ecd56a396371415.jpeg'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      berita,
                      style: TextStyle(
                        color: Color(0xFF484848),
                        fontSize: 17, height: 1.5
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var berita =
      "JAKARTA – Pemerintah Indonesia melalui Gugus Tugas Percepatan Penanganan COVID-19 mencatat bahwa virus SARS_CoV-2 atau corona jenis baru telah menginfeksi manusia di 34 Provinsi di Indonesia. Hal itu diketahui setelah Gorontalo mencatat satu kasus  terbarunya sehingga total kasus positif di Indonesia sebanyak 3.512 pada Jumat (10/4). " +
      "\n\nSementara itu ada penambahan pasien sembuh hingga total menjadi 282 dan sebanyak 306 orang meninggal dunia akibat COVID-19." + "\n\n“Ada penambahan kasus positif sebanyak 219 kasus baru sehingga total 3.512 kasus, sementara yang sembuh bertambah 30 pasien dan angka kematian naik 26 kasus,” kata Juru Bicara Pemerintah untuk Penanganan COVID-19 Achmad Yurianto dalam konferensi pers di Media Center Gugus Tugas Percepatan Penanganan COVID-19, Graha Badan Nasional Penanggulangan Bencana (BNBP) Jakarta, Jumat (10/4)." +
      "\n\nPada Kamis (9/4) tercatat 3.293 kasus positif COVID-19 dengan 252 pasien sembuh dan 280 pasien lainnya meninggal dunia. Berdasarkan data yang dihimpun Kementerian Kesehatan, Provinsi Gorontalo mencatatkan satu kasus pertama, sehingga seluruh 34 wilayah provinsi di Indonesia tercatat telah terjangkit virus tersebut.";
}
