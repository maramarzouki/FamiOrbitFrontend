import 'dart:convert';

import 'package:fami_orbit/features/auth/data/model/user.dart';
import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

class UserService {
  static final String? baseUrl = GlobalConfiguration().getValue("BASE_URL");

  static Future<String> register(User user) async {
    try {
      debugPrint("user $user");
      var url = Uri.parse('$baseUrl/registerUser');
      final response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: user.toJson(),
      );

      debugPrint('Register response body: ${response.body}');

      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        debugPrint("data['user'] ${data['user']}");
        return "User registered successfully";
      } else {
        debugPrint(
          "error while registring (statusCode != 201) : ${data['error']}",
        );
        throw Exception(data['error'] ?? 'Registration failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      // return ("error ${e.toString()}");
      rethrow;
    }
  }

  static Future<String> login(User user) async {
    try {
      var url = Uri.parse('$baseUrl/login');
      final response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: user.toJson(),
      );
      if (response.body.isEmpty) {
        throw Exception("Empty response from server");
      }

      debugPrint('Login response body: ${response.body}');

      final Map<String, dynamic>? data = jsonDecode(response.body);
      debugPrint("login resp data $data");

      if (data == null) {
        throw Exception("Failed to decode response data");
      }

      if (response.statusCode == 200) {
        if (data['token'] == null) {
          throw Exception("Server response is missing token!");
        }
        debugPrint("$data");
        return data['token'];
      } else {
        throw Exception(data['loginError'] ?? 'Unknown error occurred');
      }
    } catch (e) {
      debugPrint(e.toString());
      // throw Exception(e.toString());
      rethrow;
    }
  }
}
