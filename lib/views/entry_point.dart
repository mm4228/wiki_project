import 'package:flutter/material.dart';
import 'package:wiki_projet/Utiliity/rive_utils.dart';
import 'package:rive/rive.dart';
import 'package:wiki_projet/users/colors.dart';


class EntryPointView extends StatefulWidget {
  const EntryPointView({Key? key}) : super(key: key);

  @override
  State<EntryPointView> createState() => _EntryPointViewState();
}

class _EntryPointViewState extends State<EntryPointView> {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: GlobalsColors.mainColor.withOpacity(0.8),
                borderRadius: const BorderRadius.all((Radius.circular(24)))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(bottomNavs.length, (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      Future.delayed(const Duration(seconds: 2), () {
                        bottomNavs[index].input!.change(false);

                      });
                    },
                    child: SizedBox(
                      height: 36,
                      width: 36,
                      //On peut parcourir tout les icons de l'assets
                      child: RiveAnimation.asset(
                      bottomNavs.first.src,
                        artboard: bottomNavs[index].artboard,
                        onInit: (artboard) {
                          StateMachineController controller = RiveUtils.getRiveController(artboard, stateMachineName: bottomNavs[index].stateMachineName);
                          bottomNavs[index].input = controller.findSMI("active") as SMIBool;

                        },

                      ),
                    ),
                  ))
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

  RiveAsset(this.src, {
    required this.artboard,
    required this.stateMachineName,
    required this.title,
    this.input
});

  set setInput (SMIBool status) {
    input = status;
  }
}

List<RiveAsset> bottomNavs = [
  RiveAsset("assets/RiveAssets/Icons.riv", artboard: "HOME", stateMachineName: "HOME_Interactivity", title: "Home"),
  RiveAsset("assets/RiveAssets/Icons.riv", artboard: "SEARCH", stateMachineName: "SEARCH_Interactivity", title: "Search"),
  RiveAsset("assets/RiveAssets/Icons.riv", artboard: "CHAT", stateMachineName: "CHAT_Interactivity", title: "Chat"),
  RiveAsset("assets/RiveAssets/Icons.riv", artboard: "BELL", stateMachineName: "BELL_Interactivity", title: "Bell"),
  RiveAsset("assets/RiveAssets/Icons.riv", artboard: "SETTINGS", stateMachineName: "SETTINGS_Interactivity", title: "Settings"),
];
    