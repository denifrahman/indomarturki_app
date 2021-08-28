import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/utils/error_conection_handle.dart';

class ApiHelper {
  var _dio = Dio();
  int _repeatCounter = 0;

// Create storage
  final storage = new FlutterSecureStorage();

  Future<Dio> api() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    String? token;
    if (authBloc.session.stream.hasValue) {
      token = authBloc.session.stream.value['access_token'];
    }
    print('token'+ token.toString());
    _dio.interceptors.clear();
    _dio.clear();
    // _dio.options.baseUrl = 'http://192.168.0.8:3000';
    _dio.options.baseUrl = 'https://api.indomarturki.com';
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (token != null) {
        options.headers["Authorization"] = "Bearer " + token;
      }
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError error, handler) async {
      if (error.response != null) {
        if (error.response!.statusCode! >= 500) {
          handleShowNotification(param: {
            "statusCode": 500,
            "message": "Terjadi kesalahan silahkan ulangi lagi"
          });
          EasyLoading.dismiss(animation: true);
        }
      }
      return handler.next(error); //continue
    }));
    return _dio;
  }
}
