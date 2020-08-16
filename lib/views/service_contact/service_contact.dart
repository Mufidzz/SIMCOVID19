import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';

class ServiceContact extends StatefulWidget {
  @override
  _ServiceContactState createState() => _ServiceContactState();
}

class _ServiceContactState extends State<ServiceContact> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                new Container(
                  color: Colors.grey[200],
                  child: BgAtas(
                      title: "Kontak Layanan\n"
                          "Kementerian/Lembaga\n"
                          "Untuk COVID-19"
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  color: Colors.grey[200],
                  child: Column(
                    children: <Widget>[
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Layanan Pengaduan Program Keluarga Harapan Kementerian Sosial"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   pengaduan@pkh.kemsos.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   1500299 (hari kerja 08.00 - 17.00 WIB)")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //1
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Layanan Pengaduan Bansos Kementerian Sosial"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   bansoscovid19@kemsos.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   157")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Image(
                                      image: AssetImage('assets/images/whatsapp.png'),
                                      width: 17,
                                    ),
                                    new Text("   0811-10-222-10")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //2
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child:  new Text("Layanan Masyarakat Kartu Prakerja"),
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   021-25541246\n"
                                        "   (hari kerja 08.00 - 19.00 WIB)")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //3
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child:  new Text("Bantuan Langsung Tunai Desa"),
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   1500040")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.message, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   0877-8899-0040 / 0812-8899-0040")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //4
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child:  new Text("Pembebasan Biaya Listrik (PLN)"),
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   pln123@pln.co.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   123 / 08122-123-123")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //5
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Tambahan insentif perumahan Kementerian PUPR"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   informasi@pu.go.id")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //6
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child:  new Text("Informasi lebih lanjut mengenai perpajakan"),
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   informasi@pajak.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   1500200")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //7
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Informasi lebih lanjut mengenai bea masuk dan cukai"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   info@customs.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   1500225")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //8
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Informasi lebih lanjut mengenai Restrukturisasi Kredit "
                                    "atau Pembiayaan terkait dampak COVID-19 Layanan Kontak OJK"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   konsumen@ojk.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   157")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Image(
                                      image: AssetImage('assets/images/whatsapp.png'),
                                      width: 17,
                                    ),
                                    new Text("   081-157-157-157")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //9
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Posko Pengaduan Daring bagi Masyarakat "
                                    "Terdampak Bencana Nasional COVID-19 \nOmbudsman Pusat"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   covid19-pusat@ombudsman.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Image(
                                      image: AssetImage('assets/images/whatsapp.png'),
                                      width: 17,
                                    ),
                                    new Text("   0811-919-3737")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //10
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child:  new Text("Kejahatan Narkotika BNN"),
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   184")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Image(
                                      image: AssetImage('assets/images/whatsapp.png'),
                                      width: 17,
                                    ),
                                    new Text("   0812-2167-5675")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //11
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Align(
                                  alignment: Alignment.topLeft,
                                  child:  new Text("Pelayanan SEJIWA Kemen PPPA"),
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   pengaduan@kemenpppa.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   119 ext. 8 / 0821-2575-1234 \n"
                                        "   / 0811-1922-911")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.public, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   http://bit.ly/kamitetapada")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //12
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("WA Center Kementerian Agama Sigap COVID-19"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Image(
                                      image: AssetImage('assets/images/whatsapp.png'),
                                      width: 17,
                                    ),
                                    new Text("   081-1159-9003")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //13
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Informasi Fungsi Relawan Desa Lawan "
                                    "COVID-19 Kementerian Desa, PDT, dan Transmigrasi"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.phone, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   1500040")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.message, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   0877-8899-0040 / 0812-8899-0040")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //14
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Jalur Pengaduan bagi Pelaku Pariwisata "
                                    "dan Ekonomi Kreatif Terdampak COVID-19"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   info@kemenparekraf.go.id")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Image(
                                      image: AssetImage('assets/images/whatsapp.png'),
                                      width: 17,
                                    ),
                                    new Text("   0811-8956-767")
                                  ],
                                ),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.public, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   pedulicovid19.kemenparekraf.go.id")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //15
                      new Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: new Column(
                              children: <Widget>[
                                new Text("Layanan Pengiriman Surat ke Kementerian Perdagangan"),
                                SizedBox(height: 10),
                                new Row(
                                  children: <Widget>[
                                    new Icon(
                                      Icons.mail, color: Colors.black,
                                      size: 17.0,
                                    ),
                                    new Text("   persuratan@kemendag.go.id")
                                  ],
                                ),
                              ],
                            ),
                          )
                      ), //16
                    ],
                  ),
                ),

              ],
            )),
      ),
    );
  }
}