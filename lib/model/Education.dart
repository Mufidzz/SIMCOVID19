// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

Education educationFromJson(String str) => Education.fromJson(json.decode(str));

String educationToJson(Education data) => json.encode(data.toJson());

class Education {
  Education({
    this.data,
    this.errorMessage,
    this.message,
    this.status,
  });

  List<Datum> data;
  String errorMessage;
  String message;
  String status;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
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
    this.category,
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
  String category;
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
    category: json["Category"],
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
    "Category": category,
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
