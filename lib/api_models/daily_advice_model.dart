import 'package:meta/meta.dart';
import 'dart:convert';

List<DailyAdvicesModle> dailyAdvicesFromJson(String str) => List<DailyAdvicesModle>.from(json.decode(str).map((x) => DailyAdvicesModle.fromJson(x)));

String dailyAdvicesToJson(List<DailyAdvicesModle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DailyAdvicesModle {
  DailyAdvicesModle({
    required this.image,
    required this.title,
    required this.description,
    required this.url,
  });

  String image;
  String title;
  String description;
  String url;

  factory DailyAdvicesModle.fromJson(Map<String, dynamic> json) => DailyAdvicesModle(

    image: json["image"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "title": title,
    "description": description,
    "url": url,
  };
}
