import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:nassek/api_models/profile.dart';
import 'package:http/http.dart' as http;
import 'package:nassek/urlClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProfile with ChangeNotifier {
  Profile profile = Profile();

  getProfile() async {
    http.Response response;
    try {

      var url = Uri.parse('$baseUrl/api/account');
      var tokenValueSet = await SharedPreferences.getInstance();
      String? token = tokenValueSet.getString('token');
      response =
          await http.get(url, headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'});

      var responseBody = json.decode(response.body);
      profile=Profile.fromJson(responseBody);
      debugPrint('Profile Api Response== ${profile.email}');

      notifyListeners();
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }
}
