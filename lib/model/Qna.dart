// To parse this JSON data, do
//
//     final qna = qnaFromJson(jsonString);

import 'dart:convert';

Qna qnaFromJson(String str) => Qna.fromJson(json.decode(str));

String qnaToJson(Qna data) => json.encode(data.toJson());

class Qna {
  Qna({
    this.data,
    this.errorMessage,
    this.message,
    this.status,
  });

  List<Datum> data;
  String errorMessage;
  String message;
  String status;

  factory Qna.fromJson(Map<String, dynamic> json) => Qna(
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
    this.name,
    this.answer,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  DeletedAt deletedAt;
  String name;
  String answer;
  bool isExpanded = false;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: DeletedAt.fromJson(json["DeletedAt"]),
    name: json["Name"],
    answer: json["Answer"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt.toJson(),
    "Name": name,
    "Answer": answer,
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
