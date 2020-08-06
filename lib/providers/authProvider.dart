import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/config/globalConfig.dart';

class AuthProvider extends ChangeNotifier {
  Future<AuthProviderJson> auth(String namaPengguna, String password) async {
    final url = CONFIG.API_URL+"/user/auth";
    print(url);

    // Sesuaikan dengan API, ini request sementara
    final response = await http
        .post(url,
        body: jsonEncode({'Username': namaPengguna, 'Password': password}));

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    final authProviderJson = AuthProviderJson.fromJson(result);
    print(authProviderJson.data.id);
//    print(authProviderJson.data.id);

    if (response.statusCode == 200) {
      notifyListeners();
      return authProviderJson;
    }

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

AuthProviderJson authProviderJsonFromJson(String str) => AuthProviderJson.fromJson(json.decode(str));

String authProviderJsonToJson(AuthProviderJson data) => json.encode(data.toJson());

class AuthProviderJson {
  AuthProviderJson({
    this.data,
    this.message,
    this.status,
  });

  Data data;
  String message;
  int status;

  factory AuthProviderJson.fromJson(Map<String, dynamic> json) => AuthProviderJson(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.nik,
    this.username,
    this.alamat,
    this.email,
    this.password,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String nik;
  String username;
  String alamat;
  String email;
  String password;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    nik: json["NIK"],
    username: json["Username"],
    alamat: json["Alamat"],
    email: json["Email"],
    password: json["Password"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "NIK": nik,
    "Username": username,
    "Alamat": alamat,
    "Email": email,
    "Password": password,
  };
}

