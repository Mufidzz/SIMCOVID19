import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../components/bgAtas/bgatas.dart';

class NearHospital extends StatefulWidget {
  @override
  _NearHospitalState createState() => _NearHospitalState();
}

class _NearHospitalState extends State<NearHospital> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: ListView(
          children: <Widget>[
            BgAtas(
              title: "Daftar Rumah Sakit \nRujukan COVID-19",
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0, top: 30),
              child: Text(
                'Rumah Sakit Rujukan Terdekat',
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
                )),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 10.0, top: 10),
              child: Text(
                'Daftar Rumah Sakit:',
                style: TextStyle(color: Color(0xFF484848), fontSize: 16),
              ),
            ),
            Column(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(15),
                  child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 15, top: 15, bottom: 15),
                            child: Text(
                              'RSUP Sanglah',
                              style: TextStyle(
                                  color: Color(0xFF484848), fontSize: 16),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 15, bottom: 15),
                            child: Text(
                              '4KM dari tempat anda',
                              style: TextStyle(
                                  color: Color(0xFF173B8E), fontSize: 12),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(left: 15, bottom: 15),
                            child: Text(
                              'Jl. Diponegoro, Dauh Puri Klod, Kec. Denpasar Barat',
                              style: TextStyle(
                                  color: Color(0xFF484848), fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15, bottom: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                IconButton(
                                  color: Color(0xFF173B8E),
                                  icon: Icon(Icons.phone_android),
                                  tooltip: 'Mobile Phone',
                                  onPressed: () {},
                                ),
                                Text('085233425871'),
                                IconButton(
                                  color: Color(0xFF173B8E),
                                  icon: Icon(Icons.local_phone),
                                  tooltip: 'Local Phone',
                                  onPressed: () {},
                                ),
                                Text('0361-81102')
                              ],
                            ),
                          )
                        ],
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
