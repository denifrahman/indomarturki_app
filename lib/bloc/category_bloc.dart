import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:indomarturki_app/bloc/general_bloc.dart';
import 'package:indomarturki_app/model/category/list_category_response.dart';
import 'package:indomarturki_app/repository/category_repository.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc {
  CategoryRepository _categoryRepository = CategoryRepository();

  // ignore: close_sinks
  BehaviorSubject<ListCategoryResponse> _listCategory = BehaviorSubject<ListCategoryResponse>();

  BehaviorSubject<ListCategoryResponse> get listCategory => _listCategory;

  findAllCategory() async {
    EasyLoading.show(status: 'Loading');
    generalBloc.setLoading(true);
    ListCategoryResponse response = await _categoryRepository.findAll();
    _listCategory.sink.add(response);
    generalBloc.setLoading(false);
    EasyLoading.dismiss();
  }
}

final categoryBloc = CategoryBloc();
