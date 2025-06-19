import 'package:e_commerce/data/remote/helper/api_helper.dart';
import 'package:e_commerce/utils/constants/app_urls.dart';

class UserRepo {
  ApiHelper apiHelper;

  UserRepo({required this.apiHelper});

  Future<dynamic> registerUser({required Map<String, dynamic> bodyParams}) async{
    try{
      dynamic res = await apiHelper.postAPI(
        url: AppUrls.registerUrl,
        isAuth: true,
        params: bodyParams,
      );
      return res;
    } catch (e){
      rethrow;
    }
  }

  Future<dynamic> loginUser({required Map<String, dynamic> bodyParams}) async{
    try{
      var res = await apiHelper.postAPI(
        url: AppUrls.loginUrl,
        params: bodyParams,
        isAuth: true,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
