
import 'dart:convert';

AddFood addFoodFromJson(String str) => AddFood.fromJson(json.decode(str));

String addFoodToJson(AddFood data) => json.encode(data.toJson());

class AddFood {
  AddFood({
    this.id,
    this.tag,
    this.qty,
  });

  dynamic id;
  dynamic tag;
  dynamic qty;

  factory AddFood.fromJson(Map<String, dynamic> json) => AddFood(
    id: json["id"],
    tag: json["tag"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tag": tag,
    "qty": qty,
  };
}
