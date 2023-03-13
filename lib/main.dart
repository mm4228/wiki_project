import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wiki_projet/views/splash.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}



