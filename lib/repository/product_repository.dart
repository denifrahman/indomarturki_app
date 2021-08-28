import 'package:dio/dio.dart';
import 'package:indomarturki_app/utils/api_helper.dart';
import 'package:indomarturki_app/utils/error_conection_handle.dart';

class ProductRepository{
  ApiHelper _apiProvider = ApiHelper();

  Future<Response> findProdukByCategoryId(int categoryId, Map<String, dynamic> param) async {
    try {
      Response response = await _apiProvider
          .api()
          .then((value) => value.get("/dashboard-mobile/$categoryId", queryParameters: param));
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }

  Future<Response> findProduk(Map<String, dynamic> param) async {
    try {
      Response response = await _apiProvider
          .api()
          .then((value) => value.get("/produk", queryParameters: param));
      return response;
    } on DioError catch (e) {
      handleShowNotification(param: e.response!.data);
      return e.response!;
    }
  }
}