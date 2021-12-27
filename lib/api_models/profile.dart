// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

// ignore_for_file: file_names

import 'package:meta/meta.dart';
import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
     this.id,
     this.firstName,
     this.lastName,
     this.email,
     this.birthdate,
     this.weight,
     this.height,
     this.chronicDiseases,
     this.gender,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic birthdate;
  dynamic weight;
  dynamic height;
  dynamic chronicDiseases;
  dynamic gender;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    birthdate: json["birthdate"],
    weight: json["weight"],
    height: json["height"],
    chronicDiseases: json["chronic_diseases"],
    gender: json["gender"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "birthdate": birthdate,
    "weight": weight,
    "height": height,
    "chronic_diseases": chronicDiseases,
    "gender": gender,
  };


}
