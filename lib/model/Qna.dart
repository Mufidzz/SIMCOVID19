// To parse this JSON data, do
//
//     final qna = qnaFromJson(jsonString);

import 'dart:convert';

Qna qnaFromJson(String str) => Qna.fromJson(json.decode(str));

String qnaToJson(Qna data) => json.encode(data.toJson());

class Qna {
  Qna({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  List<QnaItem> data;
  int dataCount;
  String message;
  int status;

  factory Qna.fromJson(Map<String, dynamic> json) => Qna(
    data: List<QnaItem>.from(json["data"].map((x) => QnaItem.fromJson(x))),
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

class QnaItem {
  QnaItem({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.title,
    this.description,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  String description;
  bool isExpanded = false;

  factory QnaItem.fromJson(Map<String, dynamic> json) => QnaItem(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    title: json["Title"],
    description: json["Description"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "Title": title,
    "Description": description,
  };
}
