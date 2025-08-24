part of 'user_bloc.dart';

enum UserStatus { initial, loading, loaded, error }

class UserState extends Equatable {
  final UserStatus status;
  final List<User> users;
  final String errorMessage;
  const UserState({
    this.status = UserStatus.initial,
    this.users = const [],
    this.errorMessage = '',
  });

  UserState copyWith({
    UserStatus? status,
    List<User>? users,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [status, users, errorMessage];
}
