import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/utilities/app_color.dart';
import '../home/home_view.dart';

class SplashView extends StatelessWidget {
  static String routeName = "splashView";

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
    return Stack(
      children: [
        Container(
          color: AppColor.primaryColor,
          child: Image.asset("assets/background.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(child: Image.asset("assets/logo.png")),
        )
      ],
    );
  }
}
