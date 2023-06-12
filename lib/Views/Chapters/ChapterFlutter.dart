import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:wiki_projet/Views/ContentFlutter/ContentViewFlutterPartOne.dart';
import 'package:wiki_projet/Views/ContentFlutter/ContentViewFlutterPartTwo.dart';
import 'package:wiki_projet/Views/ContentFlutter/ContentViewFlutterPartThree.dart';
import '../Widgets/LanguageDetails.dart';

class ChapterFlutter extends StatelessWidget {
  const ChapterFlutter({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Enlève le bandeau de débogage
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: GlobalsColors.textColor,
          centerTitle: true,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            child: const LanguageDetails(
              title: 'Flutter',
              imagePath: 'assets/images/flutter_logo.svg',
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
                        builder: (context) => const ContentViewFlutterPartOne(),
                      ),
                    );
                  } else if (index == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewFlutterPartTwo(),
                      ),
                    );
                  } else if (index == 2) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewFlutterPartThree(),
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
        return 'Introduction à Flutter';
      case 1:
        return 'UI et mise en page';
      case 2:
        return 'Gestion de données';
      default:
        return '';
    }
  }
}
