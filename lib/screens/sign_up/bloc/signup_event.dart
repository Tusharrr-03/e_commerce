abstract class SignUpEvent{}

class SignUpUserEvent extends SignUpEvent{
  Map<String, dynamic> bodyParams;
  SignUpUserEvent({required this.bodyParams});

}