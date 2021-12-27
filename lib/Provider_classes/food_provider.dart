import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nassek/api_models/food.dart';
import 'package:http/http.dart' as http;
import 'package:nassek/urlClass.dart';

class FoodProvider with ChangeNotifier {
int quantity=1;
  quantityIncrement() {
    quantity += 1;
    notifyListeners();
  }
  quantityDecrement() {
    if (quantity > 1) {
      quantity -= 1;
    }
    notifyListeners();
  }


  late List<Food> foodSearchinModel;
int? length;
foodSearching(String find) async {
    http.Response response;
    try {
      var url = Uri.parse('$baseUrl/api/food_search/name?name=$find');
      response = await http.get(url);

      var jsonModels = json.decode(response.body);

      // debugPrint('Api Response== $jsonModels');

      foodSearchinModel = jsonModels
          .map<Food>((_modelJson) => Food.fromJson(_modelJson))
          .toList();

      length=foodSearchinModel.length;
      notifyListeners();

      return foodSearchinModel;
    } catch (error) {
      rethrow;
    }
  }


}
