import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:wiki_projet/Views/ContentXamarin/ContentViewXamarinPartOne.dart';
import 'package:wiki_projet/Views/ContentXamarin/ContentViewXamarinPartThree.dart';
import 'package:wiki_projet/Views/ContentXamarin/ContentViewXamarinPartTwo.dart';
import '../Widgets/LanguageDetails.dart';

class ChapterXamarin extends StatelessWidget {
  const ChapterXamarin({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalsColors.textColor,
          centerTitle: true,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            child: const LanguageDetails(
              title: 'Xamarin',
              imagePath: 'assets/images/xamarin.svg',
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  if (index == 0) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewXamarinPartOne(),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewXamarinPartTwo(),
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewXamarinPartThree(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: GlobalsColors.mainColor,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Chapitre ${index + 1}: ${_getChapterTitle(index)}',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getChapterTitle(int index) {
    switch (index) {
      case 0:
        return 'Introduction à Xamarin';
      case 1:
        return 'Interface utilisateur avec Xamarin.Forms';
      case 2:
        return 'Accès aux fonctionnalités de la plateforme';
      default:
        return '';
    }
  }
}
