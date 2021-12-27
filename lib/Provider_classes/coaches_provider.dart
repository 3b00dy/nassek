import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:nassek/api_models/coaches_modela.dart';
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/urlClass.dart';

class CoachesProvdier with ChangeNotifier {
  LoadingState loadingState = LoadingState.idle;
  List<CoachesModel>? coachesModel;
  int? length;

  fetchingCoaches() async {
    try {
      loadingState = LoadingState.loading;
      var url = Uri.parse('$baseUrl/api/coaches');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      var jsonModels = jsonDecode(response.body);
      print('Response body type: ${jsonModels.runtimeType}');
      coachesModel = jsonModels
          .map<CoachesModel>((_modelJson) => CoachesModel.fromJson(_modelJson))
          .toList();
      loadingState = LoadingState.finished;
      length = coachesModel!.length;
      notifyListeners();
    } catch (e) {
      print(e);
    }

    // print('Response body: ${models[0].name}');
    // print('Response body: ${models[0].description}');
    // print('Response body: ${coachesModel![0].description}');
    // loading = LoadingState.finished;
    return coachesModel;
  }
}
