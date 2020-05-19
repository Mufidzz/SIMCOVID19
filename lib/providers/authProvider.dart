import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  Future<bool> auth(String namaPengguna, String password) async {
    final url = "http://192.168.1.4/info_donasi/login.php";

    // Sesuaikan dengan API, ini request sementara
    final response = await http
        .post(url, body: {'username': namaPengguna, 'password': password});

    final result = json.decode(response.body);

    if (response.statusCode == 200 && result['status'] == 1) {
      notifyListeners();
      print(result['message']);
      return true;
    }
    print(result['message']);
    return false;
  }

  Future<bool> register(
      String nik, String username, String email, String password) async {
    final url = "http://192.168.1.4/CRUDMahasiswa/insert.php";

    // Sesuaikan dengan API, ini request sementara
    final response = await http.post(url, body: {
      'nim': nik,
      'nama': username,
      'fakultas': email,
      'jurusan': password
    });

    final result = json.decode(response.body);

    if (response.statusCode == 200 && result['status'] == 1) {
      notifyListeners();
      print(result['message']);
      return true;
    }
    print(result['message']);
    return false;
  }
}
