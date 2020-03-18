import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/info.dart';
import '../../service/firebase/authenticate.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is CheckUserEvent) {
      yield LoadingState();
      if (await AuthFireBase().loginWithGoogle()) {
        if(Info.fbuser != null){
          yield LoginSucessState();
        }else{
          yield LoginInitial();
        }
      }
    } else if (event is GoogleOnClickEvent) {
      yield LoadingState();
      yield await AuthFireBase().loginWithGoogle()
          ? LoginSucessState()
          : LoginFailState();
    }
  }
}
