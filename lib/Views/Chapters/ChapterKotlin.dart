import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:wiki_projet/Views/ContentKotlin/ContentViewKotlinPartOne.dart';
import 'package:wiki_projet/Views/ContentKotlin/ContentViewKotlinPartThree.dart';
import 'package:wiki_projet/Views/ContentKotlin/ContentViewKotlinPartTwo.dart';
import '../Widgets/LanguageDetails.dart';

class ChapterKotlin extends StatelessWidget {
  const ChapterKotlin({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalsColors.textColor,
          centerTitle: true,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            child: const LanguageDetails(
              title: 'Kotlin',
              imagePath: 'assets/images/Kotlin_Icon.svg',
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
                        builder: (context) => const ContentViewKotlinPartOne(),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewKotlinPartTwo(),
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewKotlinPartThree(),
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
        return 'Introduction à Kotlin';
      case 1:
        return 'UI et Interactions Utilisateur';
      case 2:
        return 'Gestion de données et des API';
      default:
        return '';
    }
  }
}
