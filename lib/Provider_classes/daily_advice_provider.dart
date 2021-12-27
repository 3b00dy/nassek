import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nassek/api_models/daily_advice_model.dart';
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/urlClass.dart';

class DailyAdviceProvider with ChangeNotifier {
  LoadingState loadingState = LoadingState.idle;

  late List<DailyAdvicesModle> dailyAdviceModel;
  int? length;

  fetchDailyAdvices() async {
    http.Response response;
    try {
      var url = Uri.parse('$baseUrl/api/daily_advice');
      response = await http.get(url);
      var jsonModels = json.decode(response.body);

      loadingState = LoadingState.loading;

      dailyAdviceModel = jsonModels
          .map<DailyAdvicesModle>(
              (_modelJson) => DailyAdvicesModle.fromJson(_modelJson))
          .toList();
      length = dailyAdviceModel.length;

      loadingState = LoadingState.finished;

      notifyListeners();

      return dailyAdviceModel;
    } catch (error) {
      rethrow;
    }
  }
}
