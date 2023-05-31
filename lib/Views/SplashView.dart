import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiki_projet/Views/LoginView.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:get/get.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {Get.to(LoginView());

    });
    return Scaffold(
      backgroundColor: GlobalsColors.mainColor,
      body:  Center(
        child: SvgPicture.asset('assets/images/Logo.svg', height: 300)
      ),
    );
  }
}
