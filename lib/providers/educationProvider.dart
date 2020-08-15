import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/model/Education.dart';

class EducationProvider extends ChangeNotifier{
  Education educationModel;

  Future<Education> fetchEducation() async{
    String url = CONFIG.API_URL+"/education/";
    final response = await http.get(url);

    if(response.statusCode == 200){

      educationModel = Education.fromJson(json.decode(response.body));

      return educationModel;
    }else{
      throw Exception('Failed to load Education');
    }
  }
}