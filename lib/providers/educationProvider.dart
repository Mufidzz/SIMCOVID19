

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Education.dart';
import 'package:http/http.dart' as http;


class EducationProvider extends ChangeNotifier{

  Future<Education> fetchEducation() async{
    String url = CONFIG.API_URL+"/education/";
    final response = await http.get(url);

    if(response.statusCode == 200){
      print(response.body);
      return Education.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load user');
    }

  }
}