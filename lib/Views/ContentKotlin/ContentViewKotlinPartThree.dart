import 'package:flutter/material.dart';

import 'package:wiki_projet/Users/GlobalsColors.dart';

import '../Widgets/LanguageDetails.dart';

class ContentViewKotlinPartThree extends StatelessWidget {
  const ContentViewKotlinPartThree({Key? key}) : super(key: key);

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
                  text: 'La gestion des données en ',
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
                  'En Kotlin, la gestion des données est essentielle pour le développement d\'applications. Vous pouvez stocker et manipuler des données de différentes manières, telles que les variables, les tableaux, les listes, les bases de données, etc. Kotlin offre des fonctionnalités avancées pour la manipulation des données, telles que la programmation orientée objet, la gestion des collections, les expressions lambda, etc. Vous pouvez également utiliser des bibliothèques tierces pour faciliter la gestion des données, telles que Room pour la gestion des bases de données ou Retrofit pour l\'accès aux API RESTful. Avec Kotlin, vous avez la flexibilité de choisir la méthode de gestion des données qui convient le mieux à votre application, en fonction de vos besoins spécifiques.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'L\'utilisation des API en ',
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
                  'Dans Kotlin, vous pouvez facilement intégrer des API externes pour accéder à des données en temps réel. Kotlin offre des fonctionnalités avancées pour effectuer des requêtes HTTP et interagir avec des API RESTful. Vous pouvez utiliser des bibliothèques telles que Retrofit ou Fuel pour simplifier les appels API et gérer les réponses. De plus, Kotlin prend en charge la sérialisation et la désérialisation JSON, vous permettant de convertir facilement les données reçues des API en objets Kotlin et vice versa. Vous pouvez également utiliser des bibliothèques de gestion des authentifications telles que OAuth pour sécuriser vos appels API. Avec Kotlin, vous pouvez exploiter pleinement le potentiel des API pour fournir des fonctionnalités avancées à vos applications.',
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
