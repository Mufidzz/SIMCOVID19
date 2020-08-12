

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Hoax.dart';
import 'package:http/http.dart' as http;

class HoaxProvider extends ChangeNotifier{

  Future<Hoax> fetchHoax() async{
    String url = CONFIG.API_URL+"/hoax/";
    final response = await http.get(url);

    if(response.statusCode == 200){
      print(response.body);
      return Hoax.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load user');
    }

  }
}