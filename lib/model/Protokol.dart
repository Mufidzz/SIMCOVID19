// To parse this JSON data, do
//
//     final protokol = protokolFromJson(jsonString);

import 'dart:convert';

Protokol protokolFromJson(String str) => Protokol.fromJson(json.decode(str));

String protokolToJson(Protokol data) => json.encode(data.toJson());

class Protokol {
  Protokol({
    this.data,
    this.errorMessage,
    this.message,
    this.status,
  });

  List<Datum> data;
  String errorMessage;
  String message;
  String status;

  factory Protokol.fromJson(Map<String, dynamic> json) => Protokol(
    data: List<Datum>.from(json["Data"].map((x) => Datum.fromJson(x))),
    errorMessage: json["ErrorMessage"],
    message: json["Message"],
    status: json["Status"],
  );

  Map<String, dynamic> toJson() => {
    "Data": List<dynamic>.from(data.map((x) => x.toJson())),
    "ErrorMessage": errorMessage,
    "Message": message,
    "Status": status,
  };
}

class Datum {
  Datum({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.oldCreatedAt,
    this.title,
    this.imageUrl,
    this.realUrl,
    this.downloadUrl,
    this.content,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DeletedAt deletedAt;
  String oldCreatedAt;
  String title;
  String imageUrl;
  String realUrl;
  String downloadUrl;
  String content;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: DeletedAt.fromJson(json["DeletedAt"]),
    oldCreatedAt: json["OldCreatedAt"],
    title: json["Title"],
    imageUrl: json["ImageURL"],
    realUrl: json["RealURL"],
    downloadUrl: json["DownloadURL"],
    content: json["Content"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt.toJson(),
    "OldCreatedAt": oldCreatedAt,
    "Title": title,
    "ImageURL": imageUrl,
    "RealURL": realUrl,
    "DownloadURL": downloadUrl,
    "Content": content,
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