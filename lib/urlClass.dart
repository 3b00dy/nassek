import 'package:shared_preferences/shared_preferences.dart';

String baseUrl= 'https://manhalmaath.pythonanywhere.com/';

String? tok;
 getToken()async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
   tok= preferences.getString('token');
  return tok;
}
