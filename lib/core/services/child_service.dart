import 'dart:convert';

import 'package:fami_orbit/core/models/child.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

class ChildService {
  static final String? baseUrl = GlobalConfiguration().getValue("BASE_URL");

  static Future<String> addChild(Child child) async {
    try {
      debugPrint("child $child");
      var url = Uri.parse('$baseUrl/addChild');
      final response = await http.post(
        url,
        headers: {'content-type': 'application/json'},
        body: child.toJson(),
      );

      debugPrint('Add Child response body: ${response.body}');

      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        debugPrint("data['newChild'] ${data['newChild']}");
        return "child registered successfully";
      } else {
        debugPrint(
          "error while adding child (statusCode != 201) : ${data['error']}",
        );
        throw Exception(data['error'] ?? 'Adding child failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      // return ("error ${e.toString()}");
      rethrow;
    }
  }

}