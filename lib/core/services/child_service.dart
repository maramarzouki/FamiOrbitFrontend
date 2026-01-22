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

  static Future<List<Child>> getAllChildren(parentID) async {
    try {
      var url = Uri.parse('$baseUrl/getAllChildren/$parentID');
      final response = await http.get(
        url,
        headers: {'content-type': 'application/json'},
      );
      final Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint('children list response data $data');
      if (response.statusCode == 200) {
        final List childrenList = data['childrenList'];
        return childrenList
            .map((item) => Child.fromMap(item as Map<String, dynamic>))
            .toList();
      } else {
        debugPrint(
          "error while getting children list (statusCode != 200) : ${data['error']}",
        );
        throw Exception(data['error'] ?? 'Getting children list failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<String> addPhoneNumber(childID, phoneNumber) async {
    try {
      var url = Uri.parse('$baseUrl/addPhoneNumber/$childID');
      final response = await http.put(
        url,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber}),
      );

      debugPrint('Add phone number response body: ${response.body}');

      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 201) {
        debugPrint("data['result'] ${data['result']}");
        return "number added successfully";
      } else {
        debugPrint(
          "error while adding phone number (statusCode != 201) : ${data['error']}",
        );
        throw Exception(data['error'] ?? 'Adding phone number failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<String> verifyPhoneNumber(childID, phoneNumber, otp) async {
    try {
      var url = Uri.parse('$baseUrl/verifyPhoneNumber/$childID');
      final response = await http.put(
        url,
        headers: {'content-type': 'application/json'},
        body: jsonEncode({'phoneNumber': phoneNumber, 'otp': otp}),
      );
      final Map<String, dynamic> data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return data['message'];
      } else {
        throw Exception(data['error'] ?? 'Verification failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<Child> getChildDetails(childID) async {
    try {
      var url = Uri.parse('$baseUrl/getChildDetails/$childID');
      final response = await http.get(
        url,
        headers: {'content-type': 'application/json'},
      );
      final Map<String, dynamic> data = jsonDecode(response.body);

      debugPrint('child details response data $data');

      if (response.statusCode == 200) {
        final childDetails = data['fetchedChild'];
        return Child.fromMap(childDetails);
      } else {
        debugPrint(
          "error while getting child details (statusCode != 200) : ${data['error']}",
        );
        throw Exception(data['error'] ?? 'Getting child details failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  static Future<String> deletChild(childID) async {
    try {
      var url = Uri.parse('$baseUrl/deleteChild/$childID');
      final response = await http.delete(
        url,
        headers: {'content-type': 'application/json'},
      );
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return "Child removed!";
      } else {
        debugPrint(
          "error while removing child (statusCode != 200) : ${data['error']}",
        );
        throw Exception(data['error'] ?? 'Removing child failed!');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
