import 'package:flutter/material.dart';
import 'package:wiki_projet/Views/ContentViewFlutter1.dart';
import 'package:wiki_projet/Views/ContentViewFlutter2.dart';
import 'package:wiki_projet/Views/ContentViewFlutter3.dart';
import 'Widgets/LanguageDetails.dart';

class chapterflutter extends StatelessWidget {
  const chapterflutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.orange,
          centerTitle: true,
          flexibleSpace: Container(
            alignment: Alignment.centerLeft,
            child: const LanguageDetails(
              title: 'Flutter',
              imagePath: 'assets/images/flutter_logo.svg',
            ),
          ),


        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ContentViewFlutter1(
                        ),
                      ),
                    );
                  // Action à effectuer lorsque le bouton Chapitre 1 est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 1: Introduction à flutter '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContentViewFlutter2(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 2 est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 2 : UI et mise en page '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContentViewFlutter3(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 3 est pressé

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 3: Gestion de données'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
