import 'package:flutter/material.dart';
import 'package:simcovid19id/components/normalList/normal_list.dart';
import 'package:simcovid19id/views/regulation/components/card_tile.dart';

class Regulation extends StatefulWidget {
  @override
  _RegulationState createState() => _RegulationState();
}

class _RegulationState extends State<Regulation> {
  @override
  Widget build(BuildContext context) {
    return NormalList(
      mainTitle: "Regulasi",
      subtitleText: "Regulasi Terbaru",
      hintTextField: "Cari Regulasi ...",
      prefixTextFieldIcon: Icon(Icons.search),
      generatorChild: Column(
        children: List.generate(10, (index) {
          return RegulationCardTile();
        }),
      ),
    );
  }
}
