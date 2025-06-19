import 'package:e_commerce/data/remote/repository/user_repo.dart';
import 'package:e_commerce/screens/login/bloc/login_event.dart';
import 'package:e_commerce/screens/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserBloc extends Bloc<LoginEvent,LoginState>{
  UserRepo userRepo;
  
  LoginUserBloc({required this.userRepo}) : super(LoginUserInitialState()){
    on<AuthUserLoginEvent>((event, emit) async{
      
      emit(LoginUserLoadingState());
      
      try{
        var res = await userRepo.loginUser(bodyParams: event.bodyParams);
        print("Response for status : ${res["status"]}");
        if (res["status"]){
          /// Shared Preferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("tokan", res['tokan']);
          print("Tokan is : $prefs");

          print("resource : ${res["status"]}");
          emit(LoginUserSuccessState());
        } else{
          print("resource : ${res["message"]}");
          emit(LoginUserFailureState(errMsg: res['message']));
        }
      } catch (e){
        emit(LoginUserFailureState(errMsg: e.toString()));
      }
      
    });
  }
}