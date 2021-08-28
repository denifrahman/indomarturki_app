import 'package:dio/dio.dart';
import 'package:indomarturki_app/model/category/list_category_response.dart';
import 'package:indomarturki_app/utils/api_helper.dart';

class CategoryRepository {
  ApiHelper _apiProvider = ApiHelper();

  Future<ListCategoryResponse> findAll() async {
      Response response = await _apiProvider.api().then((value) => value.get("/category"));
      return ListCategoryResponse.fromJson(response.data);
  }

}
