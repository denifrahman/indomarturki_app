import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:indomarturki_app/model/produk/produk_by_category_response.dart';
import 'package:indomarturki_app/model/produk/produk_enitity.dart';
import 'package:indomarturki_app/model/produk/search_produk_response.dart';
import 'package:indomarturki_app/repository/product_repository.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc {
  ProductRepository _productRepository = new ProductRepository();

  BehaviorSubject<ProdukByCategoryResponse> _productByCategory =
      BehaviorSubject<ProdukByCategoryResponse>();


  BehaviorSubject<ProdukByCategoryResponse> get productByCategory =>
      _productByCategory;

  findProdukByCategoryId(int categoryId, Map<String, dynamic> param) async {
    // EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response =
        await _productRepository.findProdukByCategoryId(categoryId, param);
    ProdukByCategoryResponse produkByCategoryResponse =
        new ProdukByCategoryResponse.fromJson(response.data);
    // EasyLoading.dismiss(animation: true);
    _productByCategory.sink.add(produkByCategoryResponse);
  }

  BehaviorSubject<SearchProdukResponse> _searchProdukResponse = BehaviorSubject<SearchProdukResponse>();

  BehaviorSubject<SearchProdukResponse> get searchProdukResponse => _searchProdukResponse;

  findProduk(Map<String, dynamic> param) async {
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response =
        await _productRepository.findProduk(param);
    SearchProdukResponse produk =
        new SearchProdukResponse.fromJson(response.data);
    EasyLoading.dismiss(animation: true);
    _searchProdukResponse.sink.add(produk);
  }
}

final producsBloc = ProductBloc();
