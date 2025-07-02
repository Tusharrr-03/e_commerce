import 'package:e_commerce/data/remote/helper/api_helper.dart';
import 'package:e_commerce/utils/constants/app_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  ApiHelper apiHelper;

  CartRepo({required this.apiHelper});

  /// Add to cart function
  Future<dynamic> addToCart({required int productId, required int qty}) async {
    var bodyParams = {"product_id": productId, "quantity": qty};

    try {
      var res = await apiHelper.postAPI(
        url: AppUrls.addToCart,
        params: bodyParams,
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }

  /// Fetch to cart
  Future<dynamic> fetchCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokan = prefs.getString("tokan");

    try {
      var res = await apiHelper.getAPI(
        url: AppUrls.viewCart,
        isAuth: true,
        mHeaders: {"Authorization": tokan.toString()},
      );
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
