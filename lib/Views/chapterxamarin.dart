import 'package:flutter/material.dart';
import 'package:wiki_projet/Views/ContentViewXamarin1.dart';
import 'package:wiki_projet/Views/ContentViewXamarin2.dart';
import 'package:wiki_projet/Views/ContentViewXamarin3.dart';

import 'Widgets/LanguageDetails.dart';

class chapterxamarin extends StatelessWidget {
  const chapterxamarin({super.key});

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
              title: 'Xamarin',
              imagePath: 'assets/images/xamarin.svg',
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
                      builder: (context) => const ContentViewXamarin1(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 1 est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 1: Introduction à Xamarin '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContentViewXamarin2(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 2 est pressé
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 2 : Interface utilisateur avec Xamarin.Forms '),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ContentViewXamarin3(
                      ),
                    ),
                  );
                  // Action à effectuer lorsque le bouton Chapitre 3 est pressé

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                ),
                child: const Text('Chapitre 3: Accès aux fonctionnalités de la plateforme'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
