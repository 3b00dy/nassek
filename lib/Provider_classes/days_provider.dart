// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:nassek/api_models/get_all_dates.dart';
import 'package:nassek/api_models/get_day.dart';
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/urlClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DaysProvider with ChangeNotifier {
  var token;
  LoadingState loadingState = LoadingState.idle;

  DaysProvider(this.token);

  bool refresh = false;
  List? body;

  List<DayCalories>? day;
  int len = -1;

  getDay() async {
    loadingState = LoadingState.loading;
    var url = Uri.parse('$baseUrl/api/Days');
    SharedPreferences tokens = await SharedPreferences.getInstance();
    token = tokens.getString('token');
    try {
      final res = await http.get(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );
      debugPrint('Loading response TypeOfGet Day.. ');
String now=DateFormat('dd/MM/yyyy').format(DateTime.now());
      var responseBody = jsonDecode(res.body);
      debugPrint('response TypeOfGet Day.. ${responseBody.runtimeType}');
      debugPrint('response body Day.. $responseBody');
      if (responseBody == []) {
        DayCalories().totalCalories;
        DayCalories().date= now as DateTime;
        DayCalories().totalFat=0;
        DayCalories().totalProtein=0;
      } else {
        day = responseBody
            .map<DayCalories>((_allDays) => DayCalories.fromJson(_allDays))
            .toList();
        len = day!.length - 1;
      }

      loadingState = LoadingState.finished;
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print('error...$e');
    }
    notifyListeners();
  }

  previousDay() {
    if (len > 0) {
      len--;
      notifyListeners();
    }
  }

  nextDay() {
    if (len < day!.length - 1) {
      len++;
      notifyListeners();
    }
  }
}
