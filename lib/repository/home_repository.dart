import 'package:dio/dio.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart';
import 'package:indomarturki_app/utils/api_helper.dart';

class HomeRepository {
  ApiHelper _apiProvider = ApiHelper();

  Future<HomeProdukSlideModel> findProdukSlide() async {
    Response response = await _apiProvider.api().then((value) => value.get("/dashboard-mobile"));
    return HomeProdukSlideModel.fromJson(response.data);
  }
}