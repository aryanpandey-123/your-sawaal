import 'package:YourSawaal/componet/Models/login_response_model.dart';
import 'package:YourSawaal/componet/Models/signup_response_model.dart';
import 'package:YourSawaal/screens/signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  Future<bool> login(LoginRequestModel requestModel) async {
    // const String endpoint = "https://reqres.in/api/login";
    const String endpoint = "http://3.6.36.203/user/login";
    final Uri url = Uri.parse(endpoint);
    final response = await http.post(
      url,
      body: requestModel.toJson(),
      // headers: <String, String>{
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json'
      // }
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
      // LoginResponseModel.fromJson(
      //   json.decode(response.body),
      // );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Future<bool> signup(signupRequestModel requestModel) async {
    const String endpoint = "https://reqres.in/api/login";
    // const String endpoint = "http://3.6.36.203/user/register";
    final Uri url = Uri.parse(endpoint);
    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 400) {
      return true;
      // signupResponseModel.fromJson(
      //   json.decode(response.body),
      // );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
