// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.data,
    this.errorMessage,
    this.message,
    this.status,
  });

  Data data;
  String errorMessage;
  String message;
  String status;

  factory User.fromJson(Map<String, dynamic> json) => User(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
