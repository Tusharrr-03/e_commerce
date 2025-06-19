abstract class SignUpState{}

class SignUpUserInitialState extends SignUpState{}
class SignUpUserLoadingState extends SignUpState{}
class SignUpUserSuccessState extends SignUpState{}
class SignUpUserFailureState extends SignUpState{
  String errorMsg;
  SignUpUserFailureState({required this.errorMsg});
}