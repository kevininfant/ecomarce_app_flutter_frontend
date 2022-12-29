import '../Models/user.dart';
import '../utils/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier {
 List<UserModel> _items = [];

  List<UserModel> get items {
    return [..._items];
  }

  UserProvider(
    this._items,
  );

  Future<void> UserSignUp(String oldpassword, newpassword) async {
    final url = Uri.parse(baseUrl + 'signup');
    try {
      final response = await http.post(url, headers: {
        'api-version': 'v1',
        'auth-key': authToken,
      }, body: {
        "action": "changePassword",
        "empCode": empCode,
        "oldPassword": oldpassword,
        "newPassword": newpassword,
      });
      var responseData = json.decode(response.body);
      print(responseData);
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
