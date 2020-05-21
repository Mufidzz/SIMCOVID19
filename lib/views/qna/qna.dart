import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simcovid19id/components/bgAtas/bgatas.dart';



class Qna extends StatefulWidget{

  @override
  _qnaState createState() => _qnaState();
}

class _qnaState extends State<Qna>{
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
                                              hintText: 'cari pertanyaan'
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
                  child: Text('Pertanyaan teratas'),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 100,
                      itemBuilder: (context, c){
                        return Container(
                          width: 310,
                          height: 200,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: card(),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
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
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed… do eiusmod tempor incididunt ut labore et dolore ',
                  style: TextStyle(
                      fontSize: 15
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.arrow_forward_ios,),
            )
          ],
        ),
      ),
    );
  }
}