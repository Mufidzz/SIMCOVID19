import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simcovid19id/config/globalConfig.dart';

class AuthProvider extends ChangeNotifier {
  Future<AuthProviderJson> auth(String email, String password) async {
    final url = CONFIG.AUTH_URL;

    final response = await http.post(url,
        body: json.encode({'Email': email, 'Password': password}));

    // final result = jsonDecode(response.body) as Map<String, dynamic>;
    // print(result);
    print(response.statusCode);
    print(response.body);
    print(json.encode(({'Email': email, 'Password': password})));

    // if (response.statusCode == 200) {
    //   final authProviderJson = AuthProviderJson.fromJson(result);
    //   notifyListeners();
    //   return authProviderJson;
    // }
  }
}

AuthProviderJson authProviderJsonFromJson(String str) =>
    AuthProviderJson.fromJson(json.decode(str));

String authProviderJsonToJson(AuthProviderJson data) =>
    json.encode(data.toJson());

class AuthProviderJson {
  AuthProviderJson({
    this.data,
    this.errorMessage,
    this.message,
    this.status,
  });

  Data data;
  String errorMessage;
  String message;
  String status;

  factory AuthProviderJson.fromJson(Map<String, dynamic> json) =>
      AuthProviderJson(
        data: Data.fromJson(json["Data"]),
        errorMessage: json["ErrorMessage"],
        message: json["Message"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data.toJson(),
        "ErrorMessage": errorMessage,
        "Message": message,
        "Status": status,
      };
}

class Data {
  Data({
    this.token,
    this.userData,
  });

  String token;
  UserData userData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["Token"],
        userData: UserData.fromJson(json["UserData"]),
      );

  Map<String, dynamic> toJson() => {
        "Token": token,
        "UserData": userData.toJson(),
      };
}

class UserData {
  UserData({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.nik,
    this.fullName,
    this.address,
    this.email,
    this.password,
    this.verificationToken,
    this.resetPasswordToken,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DeletedAt deletedAt;
  String nik;
  String fullName;
  String address;
  String email;
  String password;
  String verificationToken;
  String resetPasswordToken;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: DeletedAt.fromJson(json["DeletedAt"]),
        nik: json["NIK"],
        fullName: json["FullName"],
        address: json["Address"],
        email: json["Email"],
        password: json["Password"],
        verificationToken: json["VerificationToken"],
        resetPasswordToken: json["ResetPasswordToken"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt.toJson(),
        "NIK": nik,
        "FullName": fullName,
        "Address": address,
        "Email": email,
        "Password": password,
        "VerificationToken": verificationToken,
        "ResetPasswordToken": resetPasswordToken,
      };
}

class DeletedAt {
  DeletedAt({
    this.time,
    this.valid,
  });

  DateTime time;
  bool valid;

  factory DeletedAt.fromJson(Map<String, dynamic> json) => DeletedAt(
        time: DateTime.parse(json["Time"]),
        valid: json["Valid"],
      );

  Map<String, dynamic> toJson() => {
        "Time": time.toIso8601String(),
        "Valid": valid,
      };
}
