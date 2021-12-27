import 'dart:convert';

List<CoachesModel> coachesModelFromJson(String str) => List<CoachesModel>.from(json.decode(str).map((x) => CoachesModel.fromJson(x)));

String coachesModelToJson(List<CoachesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CoachesModel {
  CoachesModel({
    required this.name,
    required this.description,
  });

  String name;
  String description;

  factory CoachesModel.fromJson(Map<String, dynamic> json) => CoachesModel(
    name: json["name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
  };
}
