part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}
final class UserSuccess extends UserState {
  final List<UserModel> users;
  UserSuccess(this.users);
}
final class UserFailure extends UserState {
  final String message;
  UserFailure(this.message);
}
final class UserEmpty extends UserState {}

