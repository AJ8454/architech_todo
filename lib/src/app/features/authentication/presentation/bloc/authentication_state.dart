part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}

class AuthLoadedState extends AuthenticationState {
  final UserModel userModel;
  const AuthLoadedState(this.userModel);

  @override
  List<Object> get props => [userModel];
}

class AuthFailureState extends AuthenticationState {
  final String error;
  const AuthFailureState(this.error);

  @override
  List<Object> get props => [error];
}
