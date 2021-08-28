import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/screen/auth/register_page.dart';
import 'package:indomarturki_app/screen/bottom_navbar/bottom_navbar_page.dart';
import 'package:indomarturki_app/utils/widget/data_notfound_widget.dart';

// Uncomment if you use injector package.
// import 'package:my_app/framework/di/injector.dart';

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthState();
  }
}

class AuthState extends State<Auth> {
  @override
  void initState() {
    authBloc.getSession();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GoogleSignInAccount?>(
        stream: authBloc.currentUser.stream,
        builder: (context, AsyncSnapshot<GoogleSignInAccount?> snapshot) {
          if (authBloc.googleSignIn.currentUser == null) {
            return Scaffold(
              appBar: AppBar(
                title: Text('Masuk'),
              ),
              body: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/logo.png',
                        width: 200,
                      ),
                      SizedBox(height: 50),
                      _signInButton(),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  authBloc.handleSignOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavbar(currentTab: 0,),
                      ));
                },
                child: Container(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.exit_to_app),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Colors.yellowAccent.shade400,
                          Colors.yellow.shade800
                        ],
                      )),
                ),
              ),
              body: SafeArea(
                child:
                    Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blueAccent.shade400,
                                  Colors.blue
                                ],
                              ),
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // SizedBox(height: 50.0,),
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: NetworkImage(authBloc
                                        .googleSignIn.currentUser!.photoUrl!),
                                    backgroundColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                      authBloc.googleSignIn.currentUser!
                                          .displayName!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      )),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    authBloc.googleSignIn.currentUser!.email,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  StreamBuilder<Map<String, dynamic>>(
                                      stream: authBloc.session.stream,
                                      builder: (context,
                                          AsyncSnapshot<Map<String, dynamic>>
                                          snapshot) {
                                        if (snapshot.hasData) {
                                          if (snapshot.data!['data'] == null) {
                                            return DataNotFound();
                                          }
                                          return Text(
                                            snapshot.data!['data']['no_telp'],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                            ),
                                          );
                                        } else {
                                          return DataNotFound();
                                        }
                                      })
                                ]),
                          ),
                        ),
                      ],
                    ),
              ),
            );
          }
        });
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () async {
        bool? result = await authBloc.handleSign();
        if (!result!) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ));
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/google_logo.png", height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
