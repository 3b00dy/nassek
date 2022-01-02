// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:nassek/api_models/loading_State.dart';
import 'package:nassek/api_models/profile.dart';
import 'package:nassek/urlClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  late int statusCode;
  LoadingState loadingState = LoadingState.idle;

  Profile account = Profile();
  bool isObscure = true;

  String? tokenValues;
  String? userId;

  void notObscure(value) {
    isObscure = !value;
    notifyListeners();
  }

  signIn(String email, String password) async {
    var url = Uri.parse('$baseUrl/api/account/signin');

    try {
      final res = await http.post(url,
          body: jsonEncode({
            'email': email,
            'password': password,
          }));
      statusCode = res.statusCode;
      var responseBody = jsonDecode(res.body)['account'];
      var tokenResponse = jsonDecode(res.body)['token']['access'];

      tokenValues = jsonDecode(res.body)['token']['access'];

      account = Profile.fromJson(responseBody);
      print(account.id);
      debugPrint('response Type.. ${responseBody.runtimeType}');
      debugPrint('response body.. $responseBody');

      SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
      tokenValueSet.setString('token', jsonDecode(res.body)['token']['access']);

      debugPrint('response token.. $tokenResponse');

      userId = responseBody['id'];
    } catch (e) {
      print('error...${e}');
    }
    notifyListeners();
  }

  signUp(authValues) async {
    http.Response resposne;
    try {
      loadingState = LoadingState.loading;
      var url = Uri.parse('$baseUrl/api/account/signup');
      resposne = await http.post(url,
          body: jsonEncode({
            "first_name": authValues['first_name'],
            "last_name": authValues['last_name'],
            "email": authValues['email'],
            "password1": authValues['password'],
            "password2": authValues['password'],
            "birthdate": authValues['birthdate'],
            "weight": authValues['weight'],
            "height": authValues['height'],
            "chronic_diseases": authValues['chronic_diseases'],
            "gender": authValues['gender'],
          }));


      debugPrint("ValuesEntry ${authValues['birthdate']}");

      debugPrint("status code ${resposne.statusCode}");
      statusCode = resposne.statusCode;

      var tokenResponse = jsonDecode(resposne.body)['token']['access'];

      SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
      tokenValueSet.setString('token', tokenResponse);

      debugPrint("status code ${resposne.statusCode}");
      debugPrint("status code ${resposne.body}");
    } catch (error) {
      print(error.toString());
    }
    loadingState = LoadingState.finished;
  }

  logout() async {
    SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
    tokenValueSet.setString('token', 'null');
  }
}
