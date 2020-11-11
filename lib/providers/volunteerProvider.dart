import 'package:flutter/material.dart';
import 'package:simcovid19id/config/globalConfig.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VolunteerProvider extends ChangeNotifier {
  Future<int> sendVolunteer(
    String FullName,
    String Address,
    String NIK,
    String Phone,
    String Email,
    String Profession,
    String Motivation,
    String SkillsDescription,
    String Instagram,
    String Facebook,
  ) async {
    String url = CONFIG.VOLUNTEER;
    String token = CONFIG.API_TOKEN;

    var body = json.encode({
      'FullName': FullName,
      'Address': Address,
      'NIK': NIK,
      'Phone': Phone,
      'Email': Email,
      'Profession': Profession,
      'Motivation': Motivation,
      'SkillsDescription': SkillsDescription,
      'Instagram': Instagram,
      'Facebook': Facebook,
    });

    try {
      final response = await http.post(url,
          headers: {
            'Token': token,
          },
          body: body);

      return response.statusCode;
    } catch (e) {
      return 404;
    }
  }
}
