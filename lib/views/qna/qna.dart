import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Qna.dart';
import 'package:simcovid19id/providers/qnaProvider.dart';

class QnaView extends StatefulWidget {
  @override
  _qnaState createState() => _qnaState();
}

class _qnaState extends State<QnaView> {
  int _numberMessage;
  Future<Qna> futureQna;
  List<Datum> listItem;

  @override
  void initState() {
    futureQna = Provider.of<QnaProvider>(context, listen: false).fetchQna(CONFIG.API_TOKEN);
    _numberMessage = 0;
  }

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
                        child: BgAtas(title: 'QnA'),
                      ),
                      Positioned(
                          right: 16,
                          top: 16,
                          child: Stack(
                            overflow: Overflow.clip,
                            children: <Widget>[
                              Icon(
                                Icons.inbox,
                                color: Colors.white,
                                size: 36,
                              ),
                              FutureBuilder(
                                future: futureQna,
                                builder: (context, snapshot){
                                  if(snapshot.hasData){
                                    _numberMessage = snapshot.data.data.length;
                                    return notif();
                                  }
                                  return Container();
                                },
                              )
                            ],
                          )),
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
                                        child: Icon(Icons.search),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          color: Colors.white,
                                          child: TextField(
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Cari Pertanyaan...'),
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
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    child: Text('Pertanyaan teratas'),
                  ),
                  Container(
                    child: FutureBuilder(
                      future: futureQna,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          listItem = snapshot.data.data;

                          return SingleChildScrollView(
                            child: Container(
                              padding: EdgeInsets.only(
                                  right: 23, left: 23, top: 8, bottom: 30),
                              child: _buildPanel(),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget notif() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
        padding: EdgeInsets.all(2),
        color: Colors.red,
        child: Text(
          _numberMessage.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(
              () {
            listItem.elementAt(index).isExpanded = !isExpanded;
          },
        );
      },
      children: listItem.map<ExpansionPanel>(
        (Datum item) {
          return ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, top: 8, bottom: 8, right: 8),
                  child: ListTile(
                    title: Text(
                      item.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                ),
              );
            },
            body: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 22, right: 8),
                child: ListTile(
                  title: Text(
                    item.answer,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            isExpanded: item.isExpanded,
          );
        },
      ).toList(),
    );
  }
}
