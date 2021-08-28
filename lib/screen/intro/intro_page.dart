import 'package:flutter/material.dart';
import 'package:indomarturki_app/bloc/auth_bloc.dart';
import 'package:indomarturki_app/screen/bottom_navbar/bottom_navbar_page.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class Intro extends StatefulWidget {
  Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
    List<Slide> slides = [];
  @override
  void initState() {
    slides.add(
      new Slide(
        description: "WE BRING INDONESIA TO YOU",
        pathImage: "assets/logo.png",
        widthImage: 60,
        heightImage: 60,
        backgroundColor: Color(0xfff5a623),
          marginDescription: EdgeInsets.only(top: 100)
      ),
    );
    slides.add(
      new Slide(
        description: "Nikmati pengalaman berbelanja produk Indonesia di Turki yang semakin mudah, aman dan hemat",
        pathImage: "assets/logo.png",
        backgroundColor: Colors.red.shade400,
        widthImage: 60,
        heightImage: 60,
        marginDescription: EdgeInsets.only(top: 100)
      ),
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }

    void onDonePress() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavbar(currentTab: 0,),));
    }
}
