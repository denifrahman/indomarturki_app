import 'package:dio/dio.dart';
import 'package:indomarturki_app/model/order/order_request.dart';
import 'package:indomarturki_app/utils/api_helper.dart';
import 'package:indomarturki_app/utils/error_conection_handle.dart';

class CheckoutRepository {
  ApiHelper _apiProvider = ApiHelper();

  Future<Response> order(OrderRequest body) async {
    try {
      Response response = await _apiProvider
          .api()
          .then((value) => value.post("/order", data: body.toJson()));
      handleShowNotification(param: response.data);
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> findOrderByUserId(int userId) async {
    try {
      Response response = await _apiProvider
          .api()
          .then((value) => value.get("/order/user/$userId",));
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }
}
