import 'package:projectx/core/data/model/user_model.dart';
import 'package:projectx/core/data/services/user_api_service.dart';
import 'package:projectx/features/users/domain/repositories/user_repositories.dart';

class ApiUserRepository implements UserRepository {
  final UserApiService _userApiService;

  ApiUserRepository(this._userApiService);

  @override
  Future<List<User>> getUsers() async {
    return await _userApiService.getAllUsers();
  }

  @override
  Future<User> createUser(User user) async {
    return await _userApiService.createUser(user);
  }

  @override
  Future<User> updateUser(User user) async {
    return await _userApiService.updateUser(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    return await _userApiService.deleteUser(id);
  }
}
