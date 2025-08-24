import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:projectx/core/data/repositories/api_user_repository.dart';
import 'package:projectx/core/data/repositories/mock_user_repositories.dart';
import 'package:projectx/core/data/services/user_api_service.dart';
import 'package:projectx/features/users/domain/repositories/user_repositories.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<UserApiService>(() => UserApiService(sl<Dio>()));
  sl.registerLazySingleton<UserRepository>(
    () => ApiUserRepository(sl<UserApiService>()),
  );

  // sl.registerLazySingleton<UserRepository>(() => MockUserRepositories());
}
