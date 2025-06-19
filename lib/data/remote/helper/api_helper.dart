import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/data/remote/helper/app_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper {

  /// Get API function

  Future<dynamic> getAPI({required String url,
    required Map<String, String> mHeaders,
    bool isAuth = false
  }) async{

    if(isAuth){
      /// Getting tokan from Shared Preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokan = prefs.getString("tokan") ?? "";
      mHeaders["Authorization"] = "Bearer $tokan";
      print("Tokan Value $tokan");
      print("Headers : $mHeaders");
    }

    try{
      var res = await http.get(Uri.parse(url), headers: mHeaders,);
      print("Response GetAPI : $res");
      /// return returnResponse
      return returnResponse(res);
    } on SocketException catch (e){
      throw NoInternetException(errorMessage: e.toString());
    } catch(e){
      throw(e.toString());
    }

  }

  Future<dynamic> postAPI({required String url,
    Map<String, dynamic>? params,
    Map<String, String>? mHeaders,
    bool isAuth = false,
  }) async{

    if(!isAuth){
      /// Getting token from prefs
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String tokan = prefs.getString("tokan") ?? "";
      mHeaders ??= {};
      mHeaders["Authorization"] = "Bearer $tokan";
    }

    try{
      var res = await http.post(
        Uri.parse(url),
        body: params!=null ? jsonEncode(params) : null,
        headers: mHeaders,
      );
      print("Response : ${res.body}");
      ///returnResponse(res);
      return returnResponse(res);
    } on SocketException catch (e){
      throw NoInternetException(errorMessage: e.toString());
    } catch(e) {
      throw(e.toString());
    }
  }

  dynamic returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        var responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(errorMessage: response.body);

      case 401:
      case 403:
        throw UnauthorizedException(errorMessage: response.body);

      case 500:
      default:
        throw FetchDataException(errorMessage: response.body);
    }
  }
}
