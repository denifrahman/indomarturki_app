import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

ErrorConnectionHandle() {
  var con = {'status': 'false', 'message': 'connection internet no aviable'};
  return con;
}

checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return Fluttertoast.showToast(
        msg: "Check your internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } else {
    return false;
  }
}

handleShowNotification({param, position}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    return Fluttertoast.showToast(
        msg: "Check your internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: position == null
            ? ToastGravity.TOP
            : position == 'BOTTOM'
                ? ToastGravity.BOTTOM
                : ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  } else {
    if (param['statusCode'] == 201 || param['statusCode'] == 200) {
      return Fluttertoast.showToast(
          msg: param['message'],
          toastLength: Toast.LENGTH_LONG,
          gravity: position == null
              ? ToastGravity.TOP
              : position == 'BOTTOM'
              ? ToastGravity.BOTTOM
              : ToastGravity.TOP,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      return Fluttertoast.showToast(
          msg: param['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: position == null
              ? ToastGravity.TOP
              : position == 'BOTTOM'
              ? ToastGravity.BOTTOM
              : ToastGravity.TOP,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return false;
  }
}
