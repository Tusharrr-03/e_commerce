import 'package:e_commerce/data/remote/helper/api_helper.dart';
import 'package:e_commerce/utils/constants/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CatRepo {
  ApiHelper apiHelper;
  CatRepo({required this.apiHelper});

  Future<dynamic> getAllCat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokan = prefs.getString("tokan");

    try {
      dynamic res = await apiHelper.getAPI(
        url: AppUrls.categoryUrl,
        isAuth: true,
        mHeaders: {"Authorization": tokan.toString()},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
