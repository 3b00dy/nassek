import 'dart:convert';

List<Food> foodFromJson(String str) => List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

String foodToJson(List<Food> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Food {
  Food({
     this.id,
     this.name,
     this.protein,
     this.fat,
     this.calories,
     this.description,
  });

  String? id;
  String? name;
  dynamic protein;
  dynamic fat;
  dynamic calories;
  String? description;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json["id"],
    name: json["name"],
    protein: json["protein"],
    fat: json["fat"],
    calories: json["calories"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "protein": protein,
    "fat": fat,
    "calories": calories,
    "description": description,
  };
}
