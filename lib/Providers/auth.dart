import 'dart:convert';
import 'dart:developer';
import 'package:ecomerce_app/Models/user.dart';
import 'package:ecomerce_app/constants/error_handling.dart';
import 'package:ecomerce_app/constants/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../utils/app_config.dart';

class AuthProvider {
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String name,
      required String password}) async {
    try {
      UserModel user = UserModel(
          id: '',
          name: name,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(),
      );
      log(res.toString());
      httpErrorHandle(
          responce: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Created! Login with same credantianls");
          });
    } catch (e) {
      showSnackBar(context, "Account Created! buseeeee");
    }
  }
  // signin

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/signin'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      log(res.toString());
      httpErrorHandle(
          responce: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Created! Login with same credantianls");
          });
    } catch (e) {
      showSnackBar(context, "Account Created! buseeeee");
    }
  }
}
