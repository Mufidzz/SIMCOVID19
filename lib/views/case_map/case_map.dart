import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../components/bgAtas/bgatas.dart';

class CaseMap extends StatefulWidget {
  @override
  _CaseMapState createState() => _CaseMapState();
}

class _CaseMapState extends State<CaseMap> {
  GoogleMapController mapController;
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                BgAtas(
                  title: "Persebaran COVID-19",
                ),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 25.0, right: 25.0, top: 10),
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Cari Berdasarkan Provinsi',
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(fontSize: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: EdgeInsets.all(16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0, top: 30),
              child: Text(
                'Update Terkini Provinsi Bali',
                style: TextStyle(color: Color(0xFF484848), fontSize: 16),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0, top: 10),
              child: Text(
                '19 Mei 2020',
                style: TextStyle(color: Color(0xFF484848), fontSize: 12),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 20, left: 10, right: 10),
                    margin:
                        const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '277',
                          style:
                              TextStyle(color: Color(0xFFF8A23E), fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '+6 Kasus',
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 20, left: 10, right: 10),
                    margin:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '277',
                          style:
                              TextStyle(color: Color(0xFF66D478), fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '+6 Kasus',
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 20, left: 10, right: 10),
                    margin:
                        const EdgeInsets.only(left: 10.0, right: 15.0, top: 20),
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
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '277',
                          style:
                              TextStyle(color: Color(0xFFF82F2F), fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '+6 Kasus',
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 16, bottom: 20, left: 10, right: 10),
                      margin: const EdgeInsets.only(
                          left: 15.0, right: 10.0, top: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFAED9F8),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            'PDP',
                            style: TextStyle(
                              color: Color(0xFF484848),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '277',
                            style: TextStyle(
                                color: Color(0xFF4BC7F8), fontSize: 16),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '+6 Kasus',
                            style: TextStyle(
                              color: Color(0xFF484848),
                            ),
                          ),
                        ],
                      ),
                    )),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 16, bottom: 20, left: 10, right: 10),
                    margin:
                        const EdgeInsets.only(left: 10.0, right: 15.0, top: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFC7D3F2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'ODP',
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '277',
                          style:
                              TextStyle(color: Color(0xFF638AD3), fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '+6 Kasus',
                          style: TextStyle(
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
              child: Text(
                'Peta Persebaran',
                style: TextStyle(color: Color(0xFF484848), fontSize: 16),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                height: 200,
                margin: const EdgeInsets.only(
                    left: 15.0, right: 10.0, top: 20, bottom: 20),
                decoration: BoxDecoration(
                  color: Color(0xFFC7F2CD),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: GoogleMap(
                  onMapCreated: (GoogleMapController controller) {},
                  initialCameraPosition: CameraPosition(
                      bearing: 192.8334901395799,
                      target: LatLng(37.43296265331129, -122.08832357078792),
                      tilt: 59.440717697143555,
                      zoom: 19.151926040649414),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
