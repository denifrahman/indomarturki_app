import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/screen/bottom_navbar/bottom_navbar_page.dart';
import 'package:indomarturki_app/screen/intro/intro_page.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FlutterSecureStorage _flutterSecureStorage = new FlutterSecureStorage();
  Widget nextRoute = Intro();

  @override
  void initState() {
    authBloc.googleSignIn.signInSilently();
    init();
    super.initState();
  }

  init()async {
    if (await _flutterSecureStorage.read(key: 'isNew') == null) {
      await _flutterSecureStorage.write(key: 'isNew', value: 'true');
    } else {
      await _flutterSecureStorage.write(key: 'isNew', value: 'true');
      setState(() {
        nextRoute = BottomNavbar(currentTab: 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSplashScreen(
      splash: Container(
        height: 70,
        child: Column(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 200,
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: Text(
              ('WE BRING\nIndonesia to you').toUpperCase(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            )),
          ],
        ),
      ),
      splashIconSize: 200,
      nextScreen: nextRoute,
      duration: 4000,
      backgroundColor: Colors.yellow.shade600,
      // splashTransition: SplashTransition.rotationTransition,
      // pageTransitionType: PageTransitionType.scale,
    );
  }
}
