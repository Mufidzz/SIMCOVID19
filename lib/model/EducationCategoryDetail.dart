// To parse this JSON data, do
//
//     final educationCategoryDetail = educationCategoryDetailFromJson(jsonString);

import 'dart:convert';

EducationCategoryDetail educationCategoryDetailFromJson(String str) => EducationCategoryDetail.fromJson(json.decode(str));

String educationCategoryDetailToJson(EducationCategoryDetail data) => json.encode(data.toJson());

class EducationCategoryDetail {
  EducationCategoryDetail({
    this.data,
    this.dataCount,
    this.message,
    this.status,
  });

  Data data;
  int dataCount;
  String message;
  int status;

  factory EducationCategoryDetail.fromJson(Map<String, dynamic> json) => EducationCategoryDetail(
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
    this.title,
    this.education,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String title;
  List<Education> education;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
