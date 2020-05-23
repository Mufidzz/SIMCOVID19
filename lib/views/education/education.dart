import 'package:flutter/material.dart';
import 'package:simcovid19id/components/normalList/normal_list.dart';
import 'package:simcovid19id/views/education/components/card_tile.dart';

class Education extends StatefulWidget {
  @override
  _EducationState createState() => _EducationState();
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return NormalList(
      mainTitle: "Edukasi",
      subtitleText: "Edukasi Terbaru",
      hintTextField: "Cari Materi Edukasi ...",
      prefixTextFieldIcon: Icon(Icons.search),
      generatorChild: Column(
        children: List.generate(10, (index) {
          return EducationCardTile();
        }),
      ),
    );
  }
}
