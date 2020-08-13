import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Protokol.dart';
import 'package:simcovid19id/providers/protokolProvider.dart';
import 'package:simcovid19id/views/protocol/protokolitemview.dart';

class ProtocolView extends StatefulWidget {
  @override
  _ProtocolViewState createState() => _ProtocolViewState();
}

class _ProtocolViewState extends State<ProtocolView> {
  Future<Protokol> futureProtokol;

  @override
  void initState() {
    futureProtokol = Provider.of<ProtokolProvider>(context, listen: false).fetchProtokol();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  BgAtas(title: 'Protokol COVID-19'),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22, top: 8),
                    child: Text(
                      'Protokol Terbaru',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(
                          0xFF484848,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 22, right: 22),
                      child: FutureBuilder<Protokol>(
                        future: futureProtokol,
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var _data = snapshot.data.data.elementAt(index);

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ProtokolItemView(protokolItem: _data,),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    margin: EdgeInsets.only(top: 16, bottom: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 250,
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 8,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        CONFIG.IMG_URL+'/news/'+_data.image),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                _data.title,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  color: Color(0xFF484848),
                                                ),
                                              ),
                                            ),
                                          ),
                                          RaisedButton(
                                            onPressed: () {  },
                                            color: Colors.blue[100],
                                            child: Text("Unduh Materi"),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          else if(snapshot.hasError){
                            return Center(child: Text("${snapshot.error}"));
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      )
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
                                  hintText: 'Cari Protokol...'),
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


}