// To parse this JSON data, do
//
//     final protokol = protokolFromJson(jsonString);

import 'dart:convert';

Protokol protokolFromJson(String str) => Protokol.fromJson(json.decode(str));

String protokolToJson(Protokol data) => json.encode(data.toJson());

class Protokol {
  Protokol({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  List<Datum> data;
  int dataCount;
  String message;
  int status;

  factory Protokol.fromJson(Map<String, dynamic> json) => Protokol(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    dataCount: json["data_count"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "data_count": dataCount,
    "message": message,
    "status": status,
  };
}

class Datum {
  Datum({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.image,
    this.file,
    this.description,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  String image;
  String file;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    title: json["Title"],
    image: json["Image"],
    file: json["File"],
    description: json["Description"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "Title": title,
    "Image": image,
    "File": file,
    "Description": description,
  };
}
