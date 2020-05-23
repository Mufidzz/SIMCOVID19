import 'package:flutter/material.dart';
import 'package:simcovid19id/components/normalList/normal_list.dart';
import 'package:simcovid19id/views/protocol/components/card_tile.dart';

class Protocol extends StatefulWidget {
  @override
  _ProtocolState createState() => _ProtocolState();
}

class _ProtocolState extends State<Protocol> {
  @override
  Widget build(BuildContext context) {
    return NormalList(
      mainTitle: "Protokol",
      subtitleText: "Protokol Terbaru",
      hintTextField: "Cari Protokol ...",
      prefixTextFieldIcon: Icon(Icons.search),
      generatorChild: Column(
        children: List.generate(10, (index) {
          return ProtocolCardTile();
        }),
      ),
    );
  }
}
