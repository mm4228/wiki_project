import 'package:flutter/material.dart';
import 'package:wiki_projet/Views/ContentViewKotlin1.dart';
import 'package:wiki_projet/Views/ContentViewKotlin2.dart';
import 'package:wiki_projet/Views/ContentViewKotlin3.dart';

import 'Widgets/LanguageDetails.dart';

class chapterkotlin extends StatelessWidget {
  const chapterkotlin({super.key});

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
              title: 'Kotlin',
              imagePath: 'assets/images/Kotlin_Icon.svg',
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
                      builder: (context) => const ContentViewKotlin1(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 1 est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 1: Introduction à Kotlin '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContentViewKotlin2(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 2 est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 2 : UI et Interactions Utilisateur '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContentViewKotlin3(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 3 est pressé

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 3: Gestion de données et des API'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
