import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indomarturki_app/bloc/cart_bloc.dart';
import 'package:indomarturki_app/model/auth/register_request.dart';
import 'package:indomarturki_app/model/auth/username_check_exist_response.dart';
import 'package:indomarturki_app/repository/auth_repository.dart';
import 'package:indomarturki_app/screen/bottom_navbar/bottom_navbar_page.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  AuthRepository _authRepository = AuthRepository();
  FlutterSecureStorage _secureStorage = new FlutterSecureStorage();

  BehaviorSubject<GoogleSignInAccount> _currentUser =
      BehaviorSubject<GoogleSignInAccount>();

  BehaviorSubject<GoogleSignInAccount> get currentUser => _currentUser;

  /*declarasi library google sign*/
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  GoogleSignIn get googleSignIn => _googleSignIn;

  Future<bool?> handleSign() async {
    EasyLoading.show(dismissOnTap: false, status: 'Loading');
    bool? result;
    try {
      _googleSignIn.signInSilently();
      await _googleSignIn.signIn().then((value) async {
        _currentUser.sink.add(value!);
        _nama.text = value.displayName!;
        _username.text = value.email;
        _noTelp.text = '';
        _alamat.text = '';
        _password.text = '';
        Response response =
            await _authRepository.checkUsernameIsExist(value.email, value.id);
        UsernameCheckExistResponse checkExistResponse =
            UsernameCheckExistResponse.fromJson(response.data);
        if (checkExistResponse.statusCode == 200) {
          _secureStorage.write(
              key: 'session', value: json.encode(response.data));
          getSession();
          EasyLoading.showSuccess('Login Success!');
          result = true;
        } else {
          EasyLoading.dismiss(animation: true);
          result = false;
        }
      });
    } catch (err) {
      EasyLoading.dismiss(animation: true);
      return false;
    }
    return result;
  }

  handleSignOut() async {
    await _googleSignIn.signOut();
    _secureStorage.deleteAll();
    _session.sink.add({});
  }

  TextEditingController _password = TextEditingController();

  TextEditingController get password => _password;

  set password(TextEditingController value) {
    _password = value;
  }

  TextEditingController _username = TextEditingController();

  TextEditingController get username => _username;

  set username(TextEditingController value) {
    _username = value;
  }

  TextEditingController _nama = TextEditingController();

  TextEditingController get nama => _nama;

  set nama(TextEditingController value) {
    _nama = value;
  }

  TextEditingController _noTelp = TextEditingController();

  TextEditingController get noTelp => _noTelp;

  set noTelp(TextEditingController value) {
    _noTelp = value;
  }

  TextEditingController _kodeKupon = TextEditingController();

  TextEditingController get kodeKupon => _kodeKupon;

  set kodeKupon(TextEditingController value) {
    _kodeKupon = value;
  }

  TextEditingController _alamat = TextEditingController();

  TextEditingController get alamat => _alamat;

  set alamat(TextEditingController value) {
    _alamat = value;
  }

  register(RegisterRequest body, context) async {
    Response response = await _authRepository.register(body);
    await _secureStorage.write(
        key: 'session', value: json.encode(response.data));
    if (response.statusCode == 201) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNavbar(
              currentTab: 0,
            ),
          ));
      getSession();
    }
  }

  BehaviorSubject<Map<String, dynamic>> _session =
      BehaviorSubject<Map<String, dynamic>>();

  BehaviorSubject<Map<String, dynamic>> get session => _session;

  getSession() async {
    FlutterSecureStorage flutterSecureStorage = new FlutterSecureStorage();
    var session = await flutterSecureStorage.read(key: 'session');
    if (session != null) {
      Response response = await _authRepository.checkUsernameIsExist(
          json.decode(session)['data']['username'],
          json.decode(session)['data']['google_id']);
      UsernameCheckExistResponse checkExistResponse =
          UsernameCheckExistResponse.fromJson(response.data);
      _secureStorage.write(key: 'session', value: json.encode(response.data));
      if (checkExistResponse.statusCode != 200) {
        handleSignOut();
      }
      cartBloc.findCartByUserId(checkExistResponse.data!.id.toString());
      await _secureStorage.write(key: 'isNew', value: 'true');
      _nama.text = json.decode(session)['data']['nama'];
      _noTelp.text = json.decode(session)['data']['no_telp'];
      _alamat.text = json.decode(session)['data']['alamat'];
      _session.sink.add(json.decode(session));
    } else {
      print('logoput');
      _session.sink.add({});
      handleSignOut();
    }
  }
}

final authBloc = AuthBloc();
