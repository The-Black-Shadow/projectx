import 'package:projectx/core/data/model/user_model.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
  Future<User> createUser(User user);
  Future<User> updateUser(User user);
  Future<void> deleteUser(String id);
}
