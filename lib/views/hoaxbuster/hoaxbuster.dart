import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/views/hoaxbuster/item_view/hoax_item_view.dart';

void main() => runApp(HoaxBuster());


class HoaxBuster extends StatefulWidget{

  @override
  _HoaxBusterState createState() => _HoaxBusterState();
}

class _HoaxBusterState extends State<HoaxBuster>{
  int _numberMessage = 99;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xFF34324B),
      ),
    );
    return MaterialApp(
      color: Color(0xFFE9EAE9),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Material(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: BgAtas(title: 'Hoax Buster'),
                      ),
                      Positioned(
                          right: 16,
                          top: 16,
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Icon(Icons.inbox,color: Colors.white,size: 36,),
                              _numberMessage>0 ?  notif() : Container(),
                            ],
                          )
                      ),
                      Positioned.fill(
                        bottom: 1,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Icon(Icons.search)
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.white,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Cari berita hoax'
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    child: Text('Berita Hoax Terbaru'),
                  ),
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 100,
                      itemBuilder: (context, c){
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>HoaxItemView()
                                )
                            );
                          },
                          child: Container(
                            width: 310,
                            height: 200,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: card(),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget notif(){
    return ClipOval(
        child:Wrap(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(2),
              color: Colors.red,
              child: Text(
                _numberMessage.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            )
          ],
        )
    );
  }

  Widget card(){
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(10),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  '[SALAH] “Hati2 Alat Ini Sdh Di Setting Suhu 36-37°C Olh Komunis Cina Utk Mmbunuh Para Ulama2 Kita”',
                  style: TextStyle(
                      fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '16 April 2020'
              ),
            ),
            Container(
              child: Text(
                'Video aslinya direkam di Thailand. Namun, termometer yang diklaim bermerek…. []',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}