// To parse this JSON data, do
//
//     final dayCalories = dayCaloriesFromJson(jsonString);

import 'dart:convert';

DayCalories dayCaloriesFromJson(String str) => DayCalories.fromJson(json.decode(str));

String dayCaloriesToJson(DayCalories data) => json.encode(data.toJson());

class DayCalories {
  DayCalories({
    this.date,
    this.totalCalories,
    this.totalFat,
    this.totalProtein,
  });

  DateTime? date;
  double? totalCalories;
  double? totalFat;
  double? totalProtein;

  factory DayCalories.fromJson(Map<String, dynamic> json) => DayCalories(
    date: DateTime.parse(json["date"]),
    totalCalories: json["total_calories"],
    totalFat: json["total_fat"],
    totalProtein: json["total_protein"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "total_calories": totalCalories,
    "total_fat": totalFat,
    "total_protein": totalProtein,
  };
}
