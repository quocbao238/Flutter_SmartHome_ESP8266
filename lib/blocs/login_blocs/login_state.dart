part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState{
  @override
  List<Object> get props => null;
}

class LoginFailState extends LoginState{
  @override
  List<Object> get props => null;
}

class LoginSucessState extends LoginState{
  @override
  List<Object> get props => null;
}
