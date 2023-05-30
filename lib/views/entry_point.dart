import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/Utiliity/rive_utils.dart';
import 'package:rive/rive.dart';
import 'package:wiki_projet/dbFiles/dbHelper.dart';
import 'package:wiki_projet/users/colors.dart';
import 'package:wiki_projet/views/CommentaryView.dart';
import 'package:wiki_projet/views/login.dart';

class EntryPointView extends StatefulWidget {
  const EntryPointView({Key? key}) : super(key: key);

  @override
  State<EntryPointView> createState() => _EntryPointViewState();
}

class _EntryPointViewState extends State<EntryPointView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Wiki"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset('assets/images/flutter_logo.svg', height: 30),
            SizedBox(height: 6),
            Text('Flutter',
                style: TextStyle(fontSize: 32, color: Colors.black)),
            SizedBox(height: 15),
            SvgPicture.asset('assets/images/Kotlin_Icon.svg', height: 30),
            SizedBox(height: 6),
            Text('Kotlin', style: TextStyle(fontSize: 32, color: Colors.black)),
            SizedBox(height: 15),
            SvgPicture.asset('assets/images/xamarin.svg', height: 30),
            SizedBox(height: 6),
            Text('Xamarin',
                style: TextStyle(fontSize: 32, color: Colors.black)),
            SizedBox(height: 6),
          ],
        ),
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
                                builder: (context) => CommentaryView(),
                              ),
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
                          //On peut parcourir tout les icons de l'assets
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
