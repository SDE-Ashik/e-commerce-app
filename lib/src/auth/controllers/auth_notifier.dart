

import 'dart:convert';

import 'package:fashion_app/common/services/storage.dart';
import 'package:fashion_app/common/utils/environment.dart';
import 'package:fashion_app/common/utils/kstrings.dart';
import 'package:fashion_app/common/widgets/error_modal.dart';
import 'package:fashion_app/src/auth/models/auth_token_model.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class AuthNotifier with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void loginFunc(String data, BuildContext ctx) async {
    print("loading");
    setLoading();

    try {
      var url = Uri.parse("http://127.0.0.1:8000/auth/token/login");
      print("url");
      // var url = Uri.parse('${Environment.appBaseUrl}/auth/token/login');
      var response = await http.post(url,
          // headers: {
          //   'Content-Type': 'application/json',
          // },
          body: data);
      print(response);

      if (response.statusCode == 200) {
        print(response.statusCode);
        String accessToken = accessTokenModelFromJson(response.body).authToken;
        print(accessToken);

        Storage().setString('accessToken', accessToken);

        ///TODO: Get user info

        ///TODO: get user extras
        setLoading();
        ctx.go('/home');
      }
    } catch (e) {
      setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  void registrationFunc(String data, BuildContext ctx) async {
    setLoading();

    try {
      var url = Uri.parse('${Environment.appBaseUrl}/auth/users/');
    
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: data);

      if (response.statusCode == 201) {
        setLoading();
      } else if (response.statusCode == 400) {
        setLoading();
        var data = jsonDecode(response.body);
        showErrorPopup(ctx, data['password'][0], null, null);
      }
    } catch (e) {
      setLoading();
      showErrorPopup(ctx, AppText.kErrorLogin, null, null);
    }
  }

  void getUser(String accessToken) async {}
}
