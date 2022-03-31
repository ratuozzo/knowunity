import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  final String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<dynamic> get(String url) async {
    final http.Response? response;
    try {
      response = await http.get(Uri.parse(_baseUrl + url));
    } catch (e) {
      print('Error ocurred: $e');
      return null;
    }
    return response;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final http.Response? response;
    try {
      response = await http.post(
        Uri.parse(_baseUrl + url),
        body: jsonEncode(body),
        headers: {'Content-type': 'application/json; charset=UTF-8'},
      );
    } catch (e) {
      print('Error ocurred: $e');
      return null;
    }
    return response;
  }
}
