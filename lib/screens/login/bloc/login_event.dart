abstract class LoginEvent{}

class AuthUserLoginEvent extends LoginEvent{
  Map<String, dynamic> bodyParams;
  AuthUserLoginEvent({required this.bodyParams});
}