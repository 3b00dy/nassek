import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../urlClass.dart';
import '../tokenClass.dart';
import 'auth_provider.dart';

class AddFoodProvider with ChangeNotifier {
  Auth authProvider = Auth();

  int quantity = 1;

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

  addFood(id, tag, quantity) async {
    SharedPreferences tokenValueSet = await SharedPreferences.getInstance();
    String? tok = tokenValueSet.getString('token');
    var url = Uri.parse('$baseUrl/api/day');
    debugPrint('response tok.. $tok');
    try {
      final res = await http.post(url,
          headers: {
            "Content-Type": "application/json",
            'Authorization': 'Bearer $tok',
          },
          body: jsonEncode({'id': id, 'tag': tag, 'qty': quantity}));
      print('response id :$id ');

      print(res.statusCode);
      var responseBody = jsonDecode(res.body);
      var tokenResponse = jsonDecode(res.body);

      debugPrint('response Type.. ${responseBody.runtimeType}');
      debugPrint('response token.. $tokenResponse');
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
