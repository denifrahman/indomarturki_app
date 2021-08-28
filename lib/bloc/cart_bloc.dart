import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/model/cart/cart_request.dart';
import 'package:indomarturki_app/model/cart/cart_response.dart';
import 'package:indomarturki_app/model/kupon/kupon_response.dart';
import 'package:indomarturki_app/repository/cart_repository.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  CartRepository _cartRepository = new CartRepository();

  addTocart(CartRequest cart, context) async {
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response = await _cartRepository.addToCart(cart);
    if (response.statusCode == 201) {
      Navigator.pop(context);
    }
    EasyLoading.dismiss(animation: true);
  }

  updateCart(int id, CartRequest body) async {
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response = await _cartRepository.updateCart(id, body);
    if (response.statusCode == 200) {
     await findCartByUserId(authBloc.session.stream.value['data']['id'].toString());
    }
    EasyLoading.dismiss(animation: true);
  }

  removeCart(int id) async {
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response = await _cartRepository.removeCart(id);
    if (response.statusCode == 200) {
     await findCartByUserId(authBloc.session.stream.value['data']['id'].toString());
    }
    EasyLoading.dismiss(animation: true);
  }

  BehaviorSubject<CartResponse> _cart = BehaviorSubject<CartResponse>();

  BehaviorSubject<CartResponse> get cart => _cart;

  findCartByUserId(String userId) async {
    Response response = await _cartRepository.findCartByUserId(userId);
    CartResponse cartResponse = new CartResponse.fromJson(response.data);
    print(cartResponse.toJson());
    _cart.sink.add(cartResponse);
  }

  BehaviorSubject<KuponResponse> _kupon = BehaviorSubject<KuponResponse>();

  BehaviorSubject<KuponResponse> get kupon => _kupon;

  applyKupon(String kode)async{
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response = await _cartRepository.findKuponByKode(kode);
    KuponResponse kuponResponse = new KuponResponse.fromJson(response.data);
    _kupon.sink.add(kuponResponse);
    EasyLoading.dismiss(animation: true);
  }
}

final cartBloc = CartBloc();
