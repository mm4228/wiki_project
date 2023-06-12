import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';

import '../Widgets/LanguageDetails.dart';

class ContentViewXamarinPartTwo extends StatelessWidget {
  const ContentViewXamarinPartTwo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Création d\'interfaces utilisateur (UI) et gestion de la mise en page.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: GlobalsColors.mainColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Flutter est un framework de développement d\'applications multiplateformes qui permet aux développeurs de créer des interfaces utilisateur (UI) et de gérer la mise en page de manière efficace. Avec Flutter, vous pouvez créer des interfaces riches et réactives, en utilisant un langage de programmation unique, Dart. Le système de widget de Flutter offre une grande flexibilité en matière de conception d\'UI, en permettant aux développeurs de personnaliser chaque aspect de l\'apparence et du comportement de leur application. Que vous souhaitiez créer des interfaces simples ou complexes, Flutter fournit les outils nécessaires pour réaliser vos idées de conception.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),

                child: Text(
                  'Approche déclarative de Flutter pour la mise en page de l\'UI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: GlobalsColors.mainColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'L\'un des principaux avantages de Flutter est son approche de mise en page déclarative. Au lieu de manipuler directement le DOM (Document Object Model) comme dans les frameworks traditionnels, Flutter utilise un arbre de widgets pour décrire l\'UI de l\'application. Chaque widget représente un élément de l\'interface, allant des éléments de base tels que des boutons et des champs de texte aux mises en page complexes telles que des grilles et des listes. En utilisant des widgets pré-construits ou en créant les vôtres, vous pouvez organiser les éléments de l\'UI de manière hiérarchique, permettant ainsi une gestion facile et efficace de la mise en page de votre application.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Widgets prêts à l\'emploi et système de thèmes de Flutter pour des interfaces utilisateur personnalisées.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: GlobalsColors.mainColor,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'En plus de la mise en page flexible, Flutter offre également une riche collection de widgets prêts à l\'emploi pour faciliter le développement d\'UI. Ces widgets sont hautement personnalisables et s\'adaptent automatiquement aux différents facteurs tels que la taille de l\'écran et l\'orientation. Flutter fournit également un système de thèmes qui permet de gérer facilement l\'apparence globale de l\'application, en ajustant les couleurs, les polices et d\'autres propriétés visuelles. Avec cette combinaison de widgets et de thèmes, les développeurs peuvent créer des interfaces utilisateur cohérentes et attrayantes, tout en réduisant la complexité et le temps de développement.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
