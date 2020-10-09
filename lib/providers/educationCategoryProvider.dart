import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:simcovid19id/model/EducationCategory.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/model/EducationCategoryDetail.dart';

class EducationCategoryProvider extends ChangeNotifier {
  EducationCategory educationCategoryModel;
  EducationCategoryDetail educationCategoryDetailModel;

  Future<EducationCategory> fetchEducationCategory() async {
    String url = CONFIG.CATEGORY_EDUCATION_URL;
    final response = await http.get(url);

    if (response.statusCode == 200) {
      educationCategoryModel =
          EducationCategory.fromJson(json.decode(response.body));

      return educationCategoryModel;
    } else {
      throw Exception('Failed to load Education Category');
    }
  }

  Future<EducationCategoryDetail> fetchEducationCategoryDetail(int id) async {
    String url = CONFIG.CATEGORY_EDUCATION_URL + "/" + id.toString();
    final response = await http.get(url);

    if (response.statusCode == 200) {
      educationCategoryDetailModel =
          EducationCategoryDetail.fromJson(json.decode(response.body));

      return educationCategoryDetailModel;
    } else {
      throw Exception('Failed to load Education Category');
    }
  }
}
