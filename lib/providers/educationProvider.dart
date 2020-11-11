import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/Education.dart';
import 'package:http/http.dart' as http;

class EducationProvider extends ChangeNotifier{
  Education _education;

  Future<Education> fetchEducation(String token) async {
    String url = CONFIG.EDUCATION_URL;

    final response = await http.get(url, headers: {
      'Token': token
    });

    if (response.statusCode == 200) {
      _education = Education.fromJson(json.decode(response.body));

      return _education;
    } else {
      throw Exception('Failed to load protocol');
    }
  }

}
