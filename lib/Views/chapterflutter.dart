import 'package:flutter/material.dart';

class chapterflutter extends StatelessWidget {
  const chapterflutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
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
