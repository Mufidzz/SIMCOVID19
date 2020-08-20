import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/config/globalConfig.dart';

class RegisterProvider extends ChangeNotifier {
  Future<bool> register(String nik, String username, String alamat,
      String email, String password) async {
    final url = CONFIG.USER_URL;
    print(url);
    var body = jsonEncode({
      'NIK': nik,
      'Username': username,
      'Alamat': alamat,
      'Email': email,
      'Password': password
    });
    final response = await http.post(url, body: body);

    if (response.statusCode == 200) {
      notifyListeners();
      return true;
    }
    return false;
  }
}
