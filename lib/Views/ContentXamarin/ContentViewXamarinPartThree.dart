import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';

import '../Widgets/LanguageDetails.dart';

class ContentViewXamarinPartThree extends StatelessWidget {
  const ContentViewXamarinPartThree({Key? key});

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
                  'Accès aux fonctionnalités de la plateforme',
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
                  'Avec Xamarin, vous pouvez facilement accéder aux fonctionnalités spécifiques à chaque plateforme, telles que l\'appareil photo, les capteurs, la géolocalisation, les notifications push, les services de localisation, etc. Xamarin fournit une API unifiée pour accéder à ces fonctionnalités, ce qui vous permet d\'écrire du code commun pour accéder aux fonctionnalités de la plateforme. Vous pouvez utiliser des bibliothèques Xamarin spécifiques à chaque plateforme, telles que Xamarin.Essentials, pour accéder aux fonctionnalités courantes, ou utiliser des bibliothèques tierces pour accéder à des fonctionnalités plus avancées. En utilisant Xamarin, vous pouvez créer des applications qui exploitent pleinement les fonctionnalités de la plateforme cible, offrant ainsi une expérience utilisateur riche et native.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),

                child: Text(
                  'Exemples d\'accès aux fonctionnalités de la plateforme',
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
                  'Voici quelques exemples d\'accès aux fonctionnalités de la plateforme avec Xamarin :\n\n1. Accéder à l\'appareil photo : Utilisez l\'API de la caméra Xamarin pour prendre des photos et enregistrer des vidéos.\n\n2. Accéder à la géolocalisation : Utilisez les services de localisation pour obtenir les coordonnées GPS de l\'appareil.\n\n3. Envoyer des notifications push : Intégrez des services de notification push tels que Firebase Cloud Messaging pour envoyer des notifications à vos utilisateurs.\n\n4. Utiliser des services de localisation : Intégrez des services de cartographie tels que Google Maps ou Mapbox pour afficher des cartes et des itinéraires dans votre application.\n\n5. Utiliser des capteurs : Accédez aux capteurs de l\'appareil, tels que l\'accéléromètre ou le gyroscope, pour créer des fonctionnalités interactives.',
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
