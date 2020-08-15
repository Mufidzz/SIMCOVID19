// To parse this JSON data, do
//
//     final educationCategory = educationCategoryFromJson(jsonString);

import 'dart:convert';

EducationCategory educationCategoryFromJson(String str) => EducationCategory.fromJson(json.decode(str));

String educationCategoryToJson(EducationCategory data) => json.encode(data.toJson());

class EducationCategory {
  EducationCategory({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  List<Datum> data;
  int dataCount;
  String message;
  int status;

  factory EducationCategory.fromJson(Map<String, dynamic> json) => EducationCategory(
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
    this.education,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  List<Education> education;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    title: json["Title"],
    education: List<Education>.from(json["Education"].map((x) => Education.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "Title": title,
    "Education": List<dynamic>.from(education.map((x) => x.toJson())),
  };
}

class Education {
  Education({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.educationCategoryId,
    this.title,
    this.image,
    this.description,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int educationCategoryId;
  String title;
  String image;
  String description;

  factory Education.fromJson(Map<String, dynamic> json) => Education(
    id: json["ID"],
    createdAt: DateTime.parse(json["CreatedAt"]),
    updatedAt: DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    educationCategoryId: json["EducationCategoryID"],
    title: json["Title"],
    image: json["Image"],
    description: json["Description"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "CreatedAt": createdAt.toIso8601String(),
    "UpdatedAt": updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "EducationCategoryID": educationCategoryId,
    "Title": title,
    "Image": image,
    "Description": description,
  };
}
