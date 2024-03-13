// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:naya_sport_sebas/domain/services/abstract_http_login.dart';
import 'package:http/http.dart' as http;

class HttpLoginRepository extends HttpLoginService {
  @override
  Future<void> fetchData2() async {
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(
        Uri.parse('http://127.0.0.1:5500/api/auth/login'),
        headers: headers,
        body: jsonEncode(
            {"email": "naya.sports@gmail.com", "password": "Admin2023!"}));
    print(response);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
