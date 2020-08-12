// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  Data data;
  int dataCount;
  String message;
  int status;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json["data"]),
    dataCount: json["data_count"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "data_count": dataCount,
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
    this.umur,
    this.jenisKelamin,
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
  int umur;
  String jenisKelamin;
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
    umur: json["Umur"],
    jenisKelamin: json["JenisKelamin"],
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
    "Umur": umur,
    "JenisKelamin": jenisKelamin,
    "Email": email,
    "Password": password,
  };
}
