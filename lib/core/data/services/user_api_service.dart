import 'package:dio/dio.dart';
import 'package:projectx/core/data/model/user_model.dart';

class UserApiService {
  final Dio _dio;
  final String baseUrl = 'https://68a70468639c6a54e9a0af9c.mockapi.io/users';

  UserApiService(this._dio);

  //Read all users
  Future<List<User>> getAllUsers() async {
    try {
      final response = await _dio.get(baseUrl);
      print(
        (response.data as List).map((user) => User.fromJson(user)).toList(),
      );
      return (response.data as List)
          .map((user) => User.fromJson(user))
          .toList();
    } catch (e) {
      throw Exception('Failed to load users');
    }
  }

  // Create a new user
  Future<User> createUser(User user) async {
    try {
      final response = await _dio.post(baseUrl, data: user.toJson());
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to create user');
    }
  }

  // Update an existing user
  Future<User> updateUser(User user) async {
    try {
      final response = await _dio.put(
        '$baseUrl/${user.id}',
        data: user.toJson(),
      );
      return User.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to update user');
    }
  }

  // Delete an existing user
  Future<void> deleteUser(String id) async {
    try {
      await _dio.delete('$baseUrl/$id');
    } catch (e) {
      throw Exception('Failed to delete user');
    }
  }
}
