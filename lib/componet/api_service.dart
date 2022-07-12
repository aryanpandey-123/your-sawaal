import 'dart:convert';

import 'package:YourSawaal/componet/Models/login_request_model.dart';
import 'package:YourSawaal/componet/Models/login_response_model.dart';
import 'package:YourSawaal/componet/Models/signup_request_model.dart';
import 'package:YourSawaal/componet/Models/signup_response_model.dart';
import 'package:YourSawaal/componet/config.dart';
import 'package:YourSawaal/componet/shared_services.dart';
import 'package:http/http.dart' as http;

class APIservice {
  static var client = http.Client();
  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      await sharedservice.setLoginDetails(loginResponseJson(response.body));
      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(url,
        headers: requestHeaders, body: jsonEncode(model.toJson()));

    return registerResponseModel(response.body);
  }

  static Future<String> getuserprofile() async {
    var loginDetails = await sharedservice.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Basic ${loginDetails!.data.token}'
    };
    var url = Uri.http(Config.apiURL, Config.userprofile);

    var response = await client.get(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}
