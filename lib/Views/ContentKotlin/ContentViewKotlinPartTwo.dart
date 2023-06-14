import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';

import '../Widgets/LanguageDetails.dart';

class ContentViewKotlinPartTwo extends StatelessWidget {
  const ContentViewKotlinPartTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalsColors.mainColor,
        centerTitle: true,
        flexibleSpace: Container(
          alignment: Alignment.centerLeft,
          child: const LanguageDetails(
            title: 'Kotlin',
            imagePath: 'assets/images/Kotlin_Icon.svg',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'L\'UI (User Interface) en ',
                  style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: GlobalsColors.mainColor),
                  children: [
                    TextSpan(
                      text: 'Kotlin',
                      style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: GlobalsColors.mainColor),
                    ),
                    TextSpan(text: ' ?'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  'En Kotlin, l\'UI (User Interface) fait référence à la manière dont les éléments graphiques sont conçus et affichés dans une application. Kotlin offre plusieurs options pour créer des interfaces utilisateur attrayantes et réactives. Vous pouvez utiliser le système de mise en page flexible d\'Android, appelé ConstraintLayout, pour organiser les éléments de votre interface utilisateur de manière réactive en utilisant des contraintes. Kotlin propose également Anko, une bibliothèque qui facilite la création d\'interfaces utilisateur déclaratives et d\'extensions de vues. De plus, Kotlin dispose de nombreuses bibliothèques tierces et d\'outils pour améliorer la conception de l\'interface utilisateur, tels que Material Design pour créer des interfaces utilisateur élégantes et cohérentes.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'L\'interaction utilisateur en ',
                  style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: GlobalsColors.mainColor),
                  children: [
                    TextSpan(
                      text: 'Kotlin',
                      style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: GlobalsColors.mainColor),
                    ),
                    TextSpan(text: ' ?'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  'En Kotlin, l\'interaction utilisateur concerne la manière dont les utilisateurs interagissent avec l\'application et comment l\'application répond à ces interactions. Vous pouvez gérer l\'interaction utilisateur en Kotlin en utilisant des événements, des écouteurs d\'événements et des actions déclenchées par les utilisateurs. Kotlin offre des fonctionnalités intégrées pour gérer les interactions courantes telles que les clics sur les boutons, les gestes de balayage, les entrées de texte, etc. Vous pouvez également personnaliser l\'interaction utilisateur en créant des animations, des transitions et des effets visuels pour offrir une expérience utilisateur plus immersive. Kotlin permet également d\'interagir avec d\'autres composants du système, tels que l\'appareil photo, les capteurs et les services système, pour enrichir l\'expérience utilisateur.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
