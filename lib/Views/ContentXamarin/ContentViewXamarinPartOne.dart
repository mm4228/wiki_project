import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import '../Widgets/LanguageDetails.dart';

class ContentViewXamarinPartOne extends StatelessWidget {
  const ContentViewXamarinPartOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalsColors.mainColor,
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
              RichText(
                text: TextSpan(
                  text: 'Introduction à ',
                  style: TextStyle(fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: GlobalsColors.mainColor),
                  children: [
                    TextSpan(
                      text: 'Xamarin',
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
                  'Xamarin est une plateforme de développement d\'applications multiplateformes appartenant à Microsoft. Elle permet de créer des applications pour iOS, Android et Windows en utilisant un seul codebase en langage C#. Xamarin utilise le concept de développement natif, ce qui signifie que les applications Xamarin sont compilées en code natif pour chaque plateforme cible, offrant ainsi des performances et une expérience utilisateur optimales. Xamarin permet également d\'accéder facilement aux fonctionnalités et aux API spécifiques à chaque plateforme, offrant ainsi une grande flexibilité pour créer des applications riches en fonctionnalités. En outre, Xamarin dispose d\'une large communauté de développeurs et d\'une documentation complète pour faciliter l\'apprentissage et le développement d\'applications avec Xamarin.',
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
                      text: 'Xamarin',
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
                  'Pour créer un projet Xamarin, suivez les étapes suivantes :\n\n1. Installez Visual Studio : Téléchargez et installez Visual Studio, l\'environnement de développement intégré (IDE) recommandé pour le développement Xamarin.\n\n2. Créez un nouveau projet : Lancez Visual Studio, cliquez sur "File" (Fichier), puis sélectionnez "New" (Nouveau) et "Project" (Projet). Choisissez "Mobile App (Xamarin.Forms)" comme modèle de projet.\n\n3. Configurez les paramètres : Donnez un nom à votre projet, sélectionnez les plates-formes cibles (iOS, Android, Windows), et choisissez le modèle de conception (par exemple, Blank App, Master-Detail App) selon vos besoins.\n\n4. Développez votre application : Utilisez Visual Studio pour écrire le code de votre application, concevoir l\'interface utilisateur et ajouter des fonctionnalités.\n\n5. Exécutez le projet : Vous pouvez exécuter votre projet Xamarin sur un émulateur ou un appareil réel pour tester et déboguer votre application.',
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
