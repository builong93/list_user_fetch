import 'dart:convert';
import 'package:list_user_fetch/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<User> getUserById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Không tải được dữ liệu');
    }
  }

  // Lấy toàn bộ danh sách user
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
