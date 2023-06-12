import 'package:flutter/material.dart';
import 'package:wiki_projet/Utiliity/RivesUtils.dart';
import 'package:rive/rive.dart';
import 'package:wiki_projet/Views/CommentaryView.dart';
import 'package:wiki_projet/Views/ListProjetsViews.dart';
import 'package:wiki_projet/Views/UserListView.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'EntryPointView.dart';
import 'Widgets/LanguageDetails.dart';


class ContentViewKotlin1 extends StatelessWidget {

  const ContentViewKotlin1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Qu\'est-ce que Flutter ?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Flutter est un framework open-source développé par Google pour créer des applications multiplateformes. Il permet de développer des applications mobiles, web et de bureau avec un seul codebase. Flutter utilise le langage de programmation Dart et offre une expérience de développement rapide et une interface utilisateur riche et réactive.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Comment créer un projet Flutter ?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Pour créer un projet Flutter, vous devez suivre les étapes suivantes :\n\n1. Installez Flutter SDK : Téléchargez et installez le SDK Flutter à partir du site officiel de Flutter.\n\n2. Configurez l\'environnement de développement : Configurez votre IDE préféré (par exemple, Android Studio, VS Code) pour prendre en charge le développement Flutter.\n\n3. Créez un nouveau projet Flutter : Utilisez la commande `flutter create` pour créer un nouveau projet Flutter.\n\n4. Exécutez le projet : Exécutez le projet Flutter sur un émulateur ou un appareil réel à l\'aide de la commande `flutter run`.\n\n5. Développez votre application : Utilisez votre IDE pour écrire le code et développer votre application Flutter.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

