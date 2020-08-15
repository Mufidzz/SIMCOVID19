import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Protokol.dart';
import 'package:http/http.dart' as http;


class ProtokolProvider extends ChangeNotifier{
  Protokol protokolModel;

  Future<Protokol> fetchProtokol() async{
    String url = CONFIG.PROTOCOL_URL;
    final response = await http.get(url);
    if(response.statusCode == 200){

      protokolModel = Protokol.fromJson(json.decode(response.body));

      return protokolModel;
    }else{
      throw Exception('Failed to load user');
    }

  }
}