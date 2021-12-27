// To parse this JSON data, do
//
//     final diets = dietsFromJson(jsonString);

import 'dart:convert';

List<Diets> dietsFromJson(String str) => List<Diets>.from(json.decode(str).map((x) => Diets.fromJson(x)));

String dietsToJson(List<Diets> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diets {
  Diets({
    this.title,
    this.url,
  });

  String? title;
  String? url;

  factory Diets.fromJson(Map<String, dynamic> json) => Diets(
    title: json["title"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "url": url,
  };
}
