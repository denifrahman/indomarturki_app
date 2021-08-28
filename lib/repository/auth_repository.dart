import 'package:dio/dio.dart';
import 'package:indomarturki_app/model/auth/auth_response.dart';
import 'package:indomarturki_app/model/auth/register_request.dart';
import 'package:indomarturki_app/utils/api_helper.dart';
import 'package:indomarturki_app/utils/error_conection_handle.dart';

class AuthRepository {
  ApiHelper _apiProvider = ApiHelper();

  Future<AuthResponse> login() async {
    try {
      Response response =
          await _apiProvider.api().then((value) => value.get("/auth/login"));
      return AuthResponse.fromJson(response.data);
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!.data;
    }
  }

  Future<Response> checkUsernameIsExist(String username, String googleId) async {
    try {
      Response response = await _apiProvider
          .api()
          .then((value) => value.get("/user/username/$username/googleid/$googleId"));
     return response;
    } on DioError catch (e) {
      // handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> register(RegisterRequest body) async {
    try {
      Response response = await _apiProvider
          .api()
          .then((value) => value.post("/user", data: body.toJson()));
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data!);
      return e.response!;
    }
  }
}
