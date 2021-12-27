import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nassek/api_models/dietsTypes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../urlClass.dart';

class TypesOfDiets with ChangeNotifier{
  List<Diets>? dites;

  getDietTypes() async {
    http.Response response;
    try {
      var url = Uri.parse('$baseUrl/api/diets');
      response = await http.get(url);

      var responseBody = json.decode(response.body);
      dites = responseBody
          .map<Diets>((_modelJson) => Diets.fromJson(_modelJson))
          .toList();
      debugPrint('get All Date == ${dites!.length}');


      notifyListeners();

    } catch (error) {
      rethrow;
    }
  }


}