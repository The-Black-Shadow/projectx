import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:projectx/core/data/model/user_model.dart';
import 'package:projectx/features/users/domain/repositories/user_repositories.dart';

class MockUserRepositories implements UserRepository {
  List<User> _users = [];
  bool _initialized = false;

  Future<void> _initialize() async {
    if (!_initialized) {
      final String response = await rootBundle.loadString(
        'assets/mock_data/mock_user.json',
      );
      final data = await jsonDecode(response) as List;
      _users = data.map((user) => User.fromJson(user)).toList();
      _initialized = true;
    }
  }

  @override
  Future<List<User>> getUsers() async {
    await _initialize();
    //simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return _users;
  }

  @override
  Future<User> createUser(User user) async {
    await _initialize();
    //simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _users.add(user);
    return user;
  }

  @override
  Future<User> updateUser(User user) async {
    await _initialize();
    //simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    final index = _users.indexWhere((u) => u.id == user.id);
    if (index != -1) {
      _users[index] = user;
    }
    return user;
  }

  @override
  Future<void> deleteUser(String id) async {
    await _initialize();
    //simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    _users.removeWhere((user) => user.id == id);
  }
}
