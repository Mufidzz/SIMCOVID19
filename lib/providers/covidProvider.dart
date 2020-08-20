import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:simcovid19id/model/CovidNasional.dart';
import 'package:simcovid19id/model/CovidProvinsi.dart';

import '../config/globalConfig.dart';

class CovidProvider extends ChangeNotifier {
  CovidNasional covidNasionalModel;
  CovidProvinsi covidProvinsiModel;

  Future<CovidNasional> fetchCovidNasional() async {
    String url = CONFIG.COVID_NASIONAL_URL;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      covidNasionalModel = CovidNasional.fromJson(json.decode(response.body));

      return covidNasionalModel;
    } else {
      throw Exception('Failed to load Data');
    }
  }

  Future<CovidProvinsi> fetchCovidProvinsi() async {
    String url = CONFIG.COVID_PROVINSI_URL;

    final response = await http.get(url);

    if (response.statusCode == 200) {
      covidProvinsiModel = CovidProvinsi.fromJson(json.decode(response.body));

      return covidProvinsiModel;
    } else {
      throw Exception('Failed to load Data');
    }
  }
}
