import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wiki_projet/users/colors.dart';
import 'package:get/get.dart';
import 'package:wiki_projet/views/login.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {Get.to(LoginView());

    });
    return Scaffold(
      backgroundColor: GlobalsColors.mainColor,
      body: const Center(
        child: Text(
          'Logo',
          style: TextStyle(

            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
