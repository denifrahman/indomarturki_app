import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/model/auth/register_request.dart';
import 'package:indomarturki_app/screen/bottom_navbar/bottom_navbar_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () async {
            await authBloc.handleSignOut();
            Navigator.of(context)
                .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavbar(currentTab: 0,),), (Route<dynamic> route) => false);
          },
        ),
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            onWillPop: _onWillPop,
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Isikan nama anda',
                      labelText: 'Nama *',
                    ),
                    validator: (String? value) {
                      return (value!.length < 1) ? 'Silahkan isi nama' : null;
                    },
                    controller: authBloc.nama,
                  ),
                  TextFormField(
                    enabled: false,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail),
                      hintText: 'Isikan username anda',
                      labelText: 'Email *',
                    ),
                    validator: (String? value) {
                      return (value!.length < 1) ? 'Silahkan isi username' : null;
                    },
                    controller: authBloc.username,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      icon: Icon(CupertinoIcons.lock_circle_fill),
                      hintText: 'Isikan password anda',
                      labelText: 'Password *',
                    ),
                    validator: (String? value) {
                      return (value!.length < 1 && value.length < 8)
                          ? 'Silahkan password minimal 8 character'
                          : null;
                    },
                    controller: authBloc.password,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    decoration: const InputDecoration(
                      icon: Icon(CupertinoIcons.phone_circle_fill),
                      hintText: 'Isikan no telpon / whatsapp anda',
                      labelText: 'Phone / Whatsapp *',
                    ),
                    validator: (String? value) {
                      return (value!.length < 1)
                          ? 'Silahkan isi telpon / whatsapp'
                          : null;
                    },
                    controller: authBloc.noTelp,
                  ),
                  TextFormField(
                    maxLines: 3,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_on),
                      hintText: 'Isikan alamat anda',
                      labelText: 'Alamat *',
                    ),
                    validator: (String? value) {
                      return (value!.length < 1)
                          ? 'Silahkan isi alamat'
                          : null;
                    },
                    controller: authBloc.alamat,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          color: Colors.blue.shade800,
          onPressed: () {
            final FormState form = _formKey.currentState!;
            if (_formKey.currentState!.validate()) {
            RegisterRequest body = new RegisterRequest.fromJson({
              "username": authBloc.username.text,
              "password": authBloc.password.text,
              "nama": authBloc.nama.text,
              "alamat": authBloc.alamat.text,
              "no_telp": authBloc.noTelp.text,
              "google_id": authBloc.currentUser.stream.value.id,
              "role": "CUSTOMER"
            });
            authBloc.register(body, context);
            }
          },
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    // if (currentTab == 0) {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: Text('Anda yakin!'),
            content: Text('Ingin membatalkan registrasi?'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () async {
                  await authBloc.handleSignOut();
                  Navigator.of(context)
                      .pushAndRemoveUntil(MaterialPageRoute(builder: (context) => BottomNavbar(currentTab: 0,),), (Route<dynamic> route) => false);
                },
                child: Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }
}
