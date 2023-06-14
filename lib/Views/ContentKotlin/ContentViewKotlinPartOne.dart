import 'package:flutter/material.dart';
import 'package:wiki_projet/Utiliity/RivesUtils.dart';
import 'package:rive/rive.dart';
import 'package:wiki_projet/Views/CommentaryView.dart';
import 'package:wiki_projet/Views/ListProjetsView.dart';
import 'package:wiki_projet/Views/UserListView.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../EntryPointView.dart';
import '../Widgets/LanguageDetails.dart';

class ContentViewKotlinPartOne extends StatelessWidget {
  const ContentViewKotlinPartOne({Key? key}) : super(key: key);

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
                  text: 'Qu\'est-ce que ',
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
                  'Kotlin est un langage de programmation moderne qui a été développé par JetBrains, la même société qui a créé des outils populaires tels qu \'IntelliJ IDEA. Kotlin est conçu pour être entièrement compatible avec Java, ce qui signifie qu\'il peut être utilisé dans les applications Android existantes et qu\'il peut interagir de manière transparente avec le code Java. Cependant, Kotlin va au-delà de Java en introduisant des fonctionnalités puissantes et modernes telles que le typage statique, l\'inférence de types, les fonctions d\'extension et la sécurité de la nullité.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Comment créer un projet ',
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
                  'Pour créer un projet Kotlin, vous pouvez suivre les étapes suivantes :\n\nÉtape 1: Ouvrir IntelliJ IDEA (ou tout autre environnement de développement intégré - IDE) :\nAssurez-vous d\'avoir IntelliJ IDEA installé sur votre machine. Ouvrez l\'IDE pour commencer.\n\nÉtape 2: Créer un nouveau projet :\nCliquez sur "File" (Fichier) dans la barre de menu supérieure.\nSélectionnez "New" (Nouveau), puis "Project" (Projet).\nDans la fenêtre de création de projet, choisissez "Kotlin" dans la liste des langages de programmation.\nSélectionnez "Kotlin/JVM" comme type de projet.\nDonnez un nom à votre projet et spécifiez le répertoire de destination.\nCliquez sur "Finish" (Terminer) pour créer le projet.\n\nÉtape 3: Configurer le projet Kotlin :\nUne fois le projet créé, vous pouvez configurer certaines options supplémentaires, telles que la version de Kotlin à utiliser.\nDans IntelliJ IDEA, cliquez avec le bouton droit sur le nom du projet dans l\'arborescence du projet, puis sélectionnez "Open Module Settings" (Ouvrir les paramètres du module).\nDans la fenêtre des paramètres du module, sélectionnez "Project Settings" (Paramètres du projet), puis "Modules".\nSélectionnez le module correspondant à votre projet Kotlin.\nDans l\'onglet "Dependencies" (Dépendances), vous pouvez ajouter des bibliothèques supplémentaires si nécessaire.\nCliquez sur "Apply" (Appliquer) pour enregistrer les modifications.\n\nÉtape 4: Commencer à coder :\nMaintenant que votre projet Kotlin est configuré, vous pouvez commencer à écrire du code Kotlin. Vous pouvez créer de nouveaux fichiers Kotlin, ajouter des classes, des fonctions, des variables, etc. pour développer votre application.\n\nCes étapes vous donneront un point de départ pour créer un projet Kotlin dans IntelliJ IDEA. Vous pouvez personnaliser davantage votre projet en fonction de vos besoins spécifiques. N\'oubliez pas de consulter la documentation de Kotlin et les ressources en ligne pour en apprendre davantage sur la syntaxe et les fonctionnalités du langage.',
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
