import 'package:flutter/material.dart';
import 'package:simcovid19id/components/itemView/item_view.dart';

class HoaxItemView extends StatefulWidget{


  @override
  _HoaxItemState createState() => _HoaxItemState();
}

class _HoaxItemState extends State<HoaxItemView>{
  String titlePage = 'HoaxBuster';
  String title = '[SALAH] “Hati2 Alat Ini Sdh Di Setting Suhu 36-37°C Olh Komunis Cina Utk Mmbunuh Para Ulama2 Kita”';
  String time = '10 April 2020';
  String urlImage = 'https://covid19.go.id/storage/app/uploads/public/5e9/933/72c/5e993372c2922831277326.png';
  String content = 'BUKAN di Indonesia. Video aslinya direkam di Thailand. Namun, termometer yang diklaim bermerek Heaco dengan seri MDI-908 tersebut bukan produk asli perusahaan Heaco Medical Technology. Penjualan termometer palsu di Thailand memang rawan terjadi di tengah pandemi virus Corona COVID-19.';
  @override
  Widget build(BuildContext context) {

    return ItemView(
      titlePage: this.titlePage,
      title: this.title,
      time: this.time,
      urlImage: this.urlImage,
      content: this.content,
    );
  }


}