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

class ContentViewFlutterPartThree extends StatelessWidget {
  const ContentViewFlutterPartThree({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalsColors.mainColor,
        centerTitle: true,
        flexibleSpace: Container(
          alignment: Alignment.centerLeft,
          child: const LanguageDetails(
            title: 'Flutter',
            imagePath: 'assets/images/flutter_logo.svg',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                'Gestion de données en Flutter',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: GlobalsColors.mainColor,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Lorsque vous développez une application Flutter, vous devez gérer différentes formes de données. Voici quelques-unes des solutions disponibles pour la gestion de données en Flutter :',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                '1. StatefulWidgets et setState() :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: GlobalsColors.mainColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Utilisez des StatefulWidgets pour gérer les données qui peuvent changer au fil du temps. Vous pouvez utiliser la méthode setState() pour notifier le framework que l\'état a été modifié, ce qui déclenchera une reconstruction de l\'interface utilisateur avec les nouvelles données.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                '2. Provider package :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: GlobalsColors.mainColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Le package Provider est un moyen pratique de gérer l\'état global de l\'application. Il vous permet de fournir et d\'accéder aux données depuis n\'importe quel widget de l\'arborescence sans avoir à passer manuellement les données entre les widgets.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                '3. BLoC pattern :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: GlobalsColors.mainColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Le BLoC (Business Logic Component) pattern est une approche de gestion de l\'état et de la logique de l\'application. Il consiste à séparer la logique métier de l\'interface utilisateur en utilisant des streams pour gérer les flux de données et les événements.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(8),
              child: Text(
                '4. Firebase :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: GlobalsColors.mainColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Firebase est une plateforme de développement d\'applications mobiles qui propose des solutions pour la gestion des données en temps réel, le stockage, l\'authentification et bien plus encore. Vous pouvez utiliser Firebase pour gérer efficacement vos données dans votre application Flutter.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
