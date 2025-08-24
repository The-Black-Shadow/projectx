import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:projectx/core/data/model/user_model.dart';
import 'package:projectx/features/users/domain/repositories/user_repositories.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  UserBloc({required this.userRepository}) : super(const UserState()) {
    on<LoadUsers>(_loadUsers);
    on<AddUser>(_addUser);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  Future<void> _loadUsers(LoadUsers event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final users = await userRepository.getUsers();
      emit(state.copyWith(status: UserStatus.loaded, users: users));
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _addUser(AddUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final newUser = await userRepository.createUser(event.user);
      final updatedUsers = List<User>.from(state.users)..add(newUser);
      emit(state.copyWith(status: UserStatus.loaded, users: updatedUsers));
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _updateUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final updateUser = await userRepository.updateUser(event.user);
      final updatedUsers = state.users
          .map((user) => user.id == event.user.id ? updateUser : user)
          .toList();
      emit(state.copyWith(status: UserStatus.loaded, users: updatedUsers));
    } catch (e) {
      emit(
        state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> _deleteUser(DeleteUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await userRepository.deleteUser(event.userId);
      final updatedUsers = state.users
          .where((user) => user.id != event.userId)
          .toList();
      emit(state.copyWith(status: UserStatus.loaded, users: updatedUsers));
    } catch (e) {
      add(LoadUsers());
      // emit(
      //   state.copyWith(status: UserStatus.error, errorMessage: e.toString()),
      // );
    }
  }
}
