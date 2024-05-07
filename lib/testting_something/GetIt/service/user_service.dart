import 'dart:convert';
import 'package:http/http.dart' as http;

class UserServices {
  Future<List<Map<String, dynamic>>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
