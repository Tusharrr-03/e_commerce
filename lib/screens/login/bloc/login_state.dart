abstract class LoginState{}

class LoginUserInitialState extends LoginState{}
class LoginUserLoadingState extends LoginState{}
class LoginUserSuccessState extends LoginState{}
class LoginUserFailureState extends LoginState{
  String errMsg;
  LoginUserFailureState({required this.errMsg});
}