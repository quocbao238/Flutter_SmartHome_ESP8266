part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class GoogleOnClickEvent extends LoginEvent{
  @override
  List<Object> get props => null;
}

class CheckUserEvent extends LoginEvent{
  @override
  List<Object> get props => null;
}
