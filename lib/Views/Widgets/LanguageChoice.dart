import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiki_projet/Views/Chapters/ChapterFlutter.dart';
import 'package:wiki_projet/Views/Chapters/ChapterKotlin.dart';
import 'package:wiki_projet/Views/Chapters/ChapterXamarin.dart';

import 'LanguageDetails.dart';


class LanguageChoice extends StatelessWidget {
  const LanguageChoice({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),

        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                builder: (context) => const ChapterFlutter(
                  //title: 'Flutter',
                  //imagePath: 'assets/images/flutter_logo.svg',
                ),
                ) ,
              ); // Remplacez 'flutter' par le nom de votre route pour la vue Flutter
            },

            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/images/flutter_logo.svg',
                height: 90,
              ),
            ),
          ),
        ),
        const Text('Flutter', style: TextStyle(fontSize: 32, color: Colors.black)),
        const SizedBox(height: 16),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChapterKotlin(
                   /* title: 'Kotlin',
                    imagePath: 'assets/images/Kotlin_Icon.svg',*/
                  ),
                ),
              ); // Remplacez 'kotlin' par le nom de votre route pour la vue Kotlin
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/images/Kotlin_Icon.svg',
                height: 90,
              ),
            ),
          ),
        ),
        const Text('Kotlin', style: TextStyle(fontSize: 32, color: Colors.black)),
        const SizedBox(height: 16),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ChapterXamarin(
                   // title: 'Xamarin',
                    //imagePath: 'assets/images/xamarin.svg',
                  ),
                ),
              ); // Remplacez 'xamarin' par le nom de votre route pour la vue Xamarin
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/images/xamarin.svg',
                height: 90,
              ),
            ),
          ),
        ),
        const Text('Xamarin', style: TextStyle(fontSize: 32, color: Colors.black)),
        const SizedBox(height: 16),
      ],
    );
  }
}



