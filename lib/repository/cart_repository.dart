import 'package:dio/dio.dart';
import 'package:indomarturki_app/model/cart/cart_request.dart';
import 'package:indomarturki_app/utils/api_helper.dart';
import 'package:indomarturki_app/utils/error_conection_handle.dart';

class CartRepository {
  ApiHelper _apiProvider = ApiHelper();

  Future<Response> addToCart(CartRequest cart) async {
    try {
      Response response =
          await _apiProvider.api().then((value) => value.post("/cart", data: cart.toJson()));
      handleShowNotification(param: response.data);
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> updateCart(int id, CartRequest body) async {
    try {
      Response response =
          await _apiProvider.api().then((value) => value.put("/cart/$id", data: body.toJson()));
      handleShowNotification(param: response.data);
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> removeCart(int id) async {
    try {
      Response response =
          await _apiProvider.api().then((value) => value.delete("/cart/$id"));
      handleShowNotification(param: response.data);
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> findCartByUserId(String id) async {
    try {
      Response response =
          await _apiProvider.api().then((value) => value.get("/cart/user/$id"));
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> findKuponByKode(String kode) async {
    try {
      Response response = await _apiProvider.api().then((value) => value.get("/kupon/kode/$kode"));
      handleShowNotification(param: response.data);
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }
}
