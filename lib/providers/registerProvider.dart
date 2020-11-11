import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/config/globalConfig.dart';

class RegisterProvider extends ChangeNotifier {
  Future<int> register(String nik, String username, String alamat, String email,
      String password) async {
    final url = CONFIG.REGISTER_URL;
    String token = CONFIG.API_TOKEN;
    var body = json.encode({
      'NIK': nik,
      'FullName': username,
      'Address': alamat,
      'Email': email,
      'Password': password
    });

    final response = await http.post(url,
        headers: {
          'Token': token,
        },
        body: body);
    return response.statusCode;
  }
}
