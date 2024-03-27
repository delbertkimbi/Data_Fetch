part of 'users_cubit.dart';

sealed class UsersState {}

final class UsersInitial extends UsersState {}

final class UsersLoading extends UsersState {}

final class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}

final class UsersLoaded extends UsersState {
  final List<User> users;

  UsersLoaded(this.users);
}
