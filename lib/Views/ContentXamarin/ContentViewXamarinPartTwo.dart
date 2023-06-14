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
            title: 'Xamarin',
            imagePath: 'assets/images/xamarin.svg',
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
                  'L\'interface utilisateur avec Xamarin.Forms',
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
                  'Xamarin.Forms est un framework de développement d\'interfaces utilisateur multiplateformes qui permet de créer une interface utilisateur unique pour différentes plates-formes, telles qu\'iOS, Android et Windows. Avec Xamarin.Forms, vous pouvez créer des interfaces utilisateur réactives et riches en utilisant des contrôles et des vues prédéfinis, tels que des boutons, des étiquettes, des listes, des grilles, etc. Xamarin.Forms utilise le concept de balisage XAML (eXtensible Application Markup Language) pour définir la structure et l\'apparence de l\'interface utilisateur, ce qui facilite la création d\'interfaces utilisateur attrayantes et cohérentes. Vous pouvez également personnaliser l\'apparence de l\'interface utilisateur en utilisant des styles et des thèmes. Avec Xamarin.Forms, vous pouvez partager une grande partie du code de l\'interface utilisateur entre les différentes plates-formes, ce qui permet de gagner du temps et de maintenir une base de code unique.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),

                child: Text(
                  'Créer une interface utilisateur avec Xamarin.Forms',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: GlobalsColors.mainColor,
                  ),
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
                  'Pour créer une interface utilisateur avec Xamarin.Forms, vous pouvez suivre les étapes suivantes :\n\n1. Définissez votre interface utilisateur en XAML : Utilisez des balises XAML pour créer la structure et l\'apparence de votre interface utilisateur. Vous pouvez ajouter des contrôles, des mises en page, des styles, etc. selon vos besoins.\n\n2. Liez les données à l\'interface utilisateur : Utilisez la liaison de données pour relier les éléments de votre interface utilisateur aux données de votre application. Vous pouvez lier les propriétés des contrôles à des variables ou à des propriétés dans le code-behind.\n\n3. Gérez les événements utilisateur : Ajoutez des gestionnaires d\'événements pour répondre aux interactions de l\'utilisateur, tels que les clics sur les boutons, les gestes de balayage, etc.\n\n4. Testez et déboguez votre interface utilisateur : Exécutez votre application pour voir votre interface utilisateur en action, et utilisez les outils de débogage pour résoudre les problèmes éventuels.',
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
