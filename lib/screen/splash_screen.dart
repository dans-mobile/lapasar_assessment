import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 2), () => Get.off(() => HomeScreen()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Loading"),
        ),
      ),
    );
  }
}
