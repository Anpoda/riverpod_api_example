import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_api_example/model/user_model.dart';

class ApiClient {
  final _client = http.Client();

  Future<User> getUser() async {
      final http.Response response = await _client.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
      final parsed = jsonDecode(response.body)[0];
      final user = User.fromJson(parsed);
      return user;
  }
}
