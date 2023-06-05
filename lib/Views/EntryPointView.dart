import 'package:flutter/material.dart';
import 'package:wiki_projet/Utiliity/RivesUtils.dart';
import 'package:rive/rive.dart';
import 'package:wiki_projet/Views/CommentaryView.dart';
import 'package:wiki_projet/Views/ListProjetsViews.dart';
import 'package:wiki_projet/Views/SettingsView.dart';
import 'package:wiki_projet/Views/UserListView.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wiki_projet/Views/ContentViewFlutter1.dart';
import 'package:wiki_projet/Views/Widgets/LanguageChoice.dart';

class EntryPointView extends StatefulWidget {
  const EntryPointView({Key? key}) : super(key: key);

  @override
  State<EntryPointView> createState() => _EntryPointViewState();
}

class _EntryPointViewState extends State<EntryPointView> {
  String filterText = '';

  @override
  Widget build(BuildContext context) {
    List<String> languages = ['Flutter', 'Kotlin', 'Xamarin'];

    List<String> filteredLanguages = languages
        .where((lang) =>
        lang.toLowerCase().contains(filterText.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/Logo.svg', height: 200),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: const Center(

        child: LanguageChoice(),

      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              color: GlobalsColors.mainColor.withOpacity(0.8),
              borderRadius: const BorderRadius.all((Radius.circular(24)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavs.length,
                    (index) => GestureDetector(
                  onTap: () {
                    if (index == 2) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CommentaryView(),
                        ),
                      );
                    }
                    if (index == 3) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProjectListPage(),
                        ),
                      );
                    }
                    if (index == 4) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SettingsView(),
                        ),
                      );
                    }
                    if (index == 1) {
                      // Ouvrir la barre de recherche
                      showSearch(
                        context: context,
                        delegate: _LanguageSearchDelegate(languages),
                      );
                    }
                    bottomNavs[index].input!.change(true);
                    Future.delayed(const Duration(seconds: 2), () {
                      bottomNavs[index].input!.change(false);
                    });
                  },
                  child: SizedBox(
                    height: 36,
                    width: 36,
                    child: RiveAnimation.asset(
                      bottomNavs.first.src,
                      artboard: bottomNavs[index].artboard,
                      onInit: (artboard) {
                        StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName:
                            bottomNavs[index].stateMachineName);
                        bottomNavs[index].input =
                        controller.findSMI("active") as SMIBool;
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RiveAsset {
  final String artboard, stateMachineName, title, src;
  late SMIBool? input;

  RiveAsset(this.src,
      {required this.artboard,
        required this.stateMachineName,
        required this.title,
        this.input});

  set setInput(SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "HOME", stateMachineName: "HOME_Interactivity", title: "Home"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "SEARCH",
      stateMachineName: "SEARCH_Interactivity",
      title: "Search"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Bell"),
  RiveAsset("assets/RiveAssets/Icons.riv",
      artboard: "SETTINGS",
      stateMachineName: "SETTINGS_Interactivity",
      title: "Settings"),
];

class _LanguageSearchDelegate extends SearchDelegate<String> {
  final List<String> languages;

  _LanguageSearchDelegate(this.languages);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> filteredLanguages = languages
        .where((lang) => lang.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredLanguages.length,
      itemBuilder: (context, index) {
        final language = filteredLanguages[index];
        return ListTile(
          title: Text(language),
          onTap: () {
            navigateToLanguagePage(context, language);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> filteredLanguages = languages
        .where((lang) => lang.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredLanguages.length,
      itemBuilder: (context, index) {
        final language = filteredLanguages[index];
        return ListTile(
          title: Text(language),
          onTap: () {
            query = language;
            showResults(context);
          },
        );
      },
    );
  }

  void navigateToLanguagePage(BuildContext context, String language) {
    // Ici, vous pouvez personnaliser la page dédiée pour chaque langage
    if (language == 'Flutter') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguagePage(
            language: language,
            description: 'Description de Flutter',
          ),
        ),
      );
    } else if (language == 'Kotlin') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguagePage(
            language: language,
            description: 'Description de Kotlin',
          ),
        ),
      );
    } else if (language == 'Xamarin') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguagePage(
            language: language,
            description: 'Description de Xamarin',
          ),
        ),
      );
    }
  }
}

class LanguagePage extends StatelessWidget {
  final String language;
  final String description;

  LanguagePage({required this.language, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language),
      ),
      body: Center(
        child: Text(description),
      ),
    );
  }
}
