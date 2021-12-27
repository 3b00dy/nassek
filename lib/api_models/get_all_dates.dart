// To parse this JSON data, do
//
//     final allDates = allDatesFromJson(jsonString);

import 'dart:convert';

List<AllDates> allDatesFromJson(String str) => List<AllDates>.from(json.decode(str).map((x) => AllDates.fromJson(x)));

String allDatesToJson(List<AllDates> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllDates {
  AllDates({
    this.date,
  });

  DateTime? date;

  factory AllDates.fromJson(Map<String, dynamic> json) => AllDates(
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
  };
}
