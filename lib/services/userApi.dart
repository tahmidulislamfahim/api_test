import 'dart:convert';
import 'package:api_test/models/user.dart';
import 'package:http/http.dart' as http;

class Userapi {
  static Future<List<User>> fetchUsers() async {
    final url = Uri.https('randomuser.me', '/api/', {'results': '50'});
    final response = await http.get(url);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    return results.map((e) => User.fromJson(e)).toList();
  }
}
