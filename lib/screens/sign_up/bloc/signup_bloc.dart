import 'package:e_commerce/data/remote/repository/user_repo.dart';
import 'package:e_commerce/screens/sign_up/bloc/signup_event.dart';
import 'package:e_commerce/screens/sign_up/bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  UserRepo userRepo;

  SignUpBloc({required this.userRepo}) : super(SignUpUserInitialState()) {
    on<SignUpUserEvent>((event, emit) async {
      emit(SignUpUserLoadingState());

      try {
        var res = await userRepo.registerUser(bodyParams: event.bodyParams);
        print("Response for status : ${res["status"]}");
        if (res["status"]) {
          print("resource : ${res["status"]}");
          emit(SignUpUserSuccessState());
        } else {
          emit(SignUpUserFailureState(errorMsg: res["message"]));
          print("resources : ${res["message"]}");
        }
      } catch (e) {
        emit(SignUpUserFailureState(errorMsg: e.toString()));
      }
    });
  }
}

/*class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepo userRepo;

  SignUpBloc({required this.userRepo}) : super(SignUpUserInitialState()) {
    on<SignUpUserEvent>((event, emit) async {
      emit(SignUpUserLoadingState());

      try {
        var res = await userRepo.registerUser(bodyParams: event.bodyParams);

        print("API response: $res");

        if (res == null) {
          emit(SignUpUserFailureState(errorMsg: "Server did not return any response."));
          return;
        }

        if (res['status'] == true || res['status'].toString() == 'true') {
          emit(SignUpUserSuccessState());
          return;
        } else {
          emit(SignUpUserFailureState(errorMsg: res["message"] ?? "Registration failed"));
          return;
        }
      } catch (e) {
        emit(SignUpUserFailureState(errorMsg: e.toString()));
      }
    });
  }
}*/
