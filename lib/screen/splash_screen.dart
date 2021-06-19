import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lapasar_assessment/controller/home_controller.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //create controller
  HomeController _controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 5), () {
      if (_controller.isFetched.value == true) Get.off(() => HomeScreen());
      Timer(Duration(seconds: 10), () {
        Get.off(() => HomeScreen());
      });
    });

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
