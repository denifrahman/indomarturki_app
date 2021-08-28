import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/order/order_by_user_id_response.dart';
import 'package:indomarturki_app/model/order/order_request.dart';
import 'package:indomarturki_app/repository/checkout_repository.dart';
import 'package:indomarturki_app/screen/bottom_navbar/bottom_navbar_page.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class CheckoutBloc {
  CheckoutRepository _checkoutRepository = CheckoutRepository();

  order(OrderRequest body, context) async {
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    Response response = await _checkoutRepository.order(body);
    if (response.statusCode == 201) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => BottomNavbar(
              currentTab: 2,
            ),
          ),
          (Route<dynamic> route) => false);
      EasyLoading.dismiss(animation: true);
      var text =
          "${authBloc.session.stream.value['data']['nama']}\n\nOrder List :\n${body.orderDetails!.map((e) => e.name.toString() + " qty " + e.qty.toString() + ' * ₺' + e.harga.toString() + " = ₺" + e.total.toString()).join('\n')} \n\n\nDiskon ₺ ${body.orderDiskon.toString()} \n Total ₺ ${body.orderTotal.toString()}";
      var url = 'https://web.whatsapp.com/send?phone=081331339866&text=${text}';
      final link = WhatsAppUnilink(
        phoneNumber: '+905522599888',
        text: text,
      );
      await launch('$link');
      if (authBloc.session.stream.hasValue) {
        cartBloc.findCartByUserId(authBloc.session.stream.value['data']['id']);
        findOrderByUserId(authBloc.session.stream.value['data']['id']);
      }
    }
  }

  BehaviorSubject<OrderByUserIdResponse> _orderUserResponse =
      BehaviorSubject<OrderByUserIdResponse>();

  BehaviorSubject<OrderByUserIdResponse> get orderUserResponse =>
      _orderUserResponse;

  findOrderByUserId(int userId) async {
    EasyLoading.show(status: 'Loading');
    Response response = await _checkoutRepository.findOrderByUserId(userId);
    OrderByUserIdResponse byUserIdResponse =
        new OrderByUserIdResponse.fromJson(response.data);
    orderUserResponse.sink.add(byUserIdResponse);
    EasyLoading.dismiss(animation: true);
  }
}

final checkoutBloc = CheckoutBloc();
