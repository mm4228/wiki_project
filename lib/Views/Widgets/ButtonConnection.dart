import 'package:flutter/material.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/Views/UserListView.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:wiki_projet/Views/EntryPointView.dart';

import '../../DataBase/DbHelper.dart';

class ButtonConnection extends StatelessWidget {
  final User? user;
  final Function onPressed;
  final TextEditingController mdpcontroller;
  final TextEditingController mailcontroller;

  const ButtonConnection({
    Key? key,
    required this.mdpcontroller,
    required this.mailcontroller,
    required this.onPressed,
    this.user,
  }) : super(key: key);

  Future<void> _authenticateUser(BuildContext context) async {
    final String email = mailcontroller.text;
    final String password = mdpcontroller.text;

    final User? authenticatedUser = await DbHelper.getUserVerifyMailPassword(email, password);

    if(email == "admin" && password == "admin") {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UserListView(),),);


    } else {

      if (authenticatedUser != null) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EntryPointView(),),);
        // Authentification réussie
      } else {
        // Authentification échouée
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Authentification échouée'),
            content: Text('Le mail ou le mot de passe est incorrect.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onPressed();
        await _authenticateUser(context);
      },
      child: Container(
        alignment: Alignment.center,
        height: 55,
        decoration: BoxDecoration(
          color: GlobalsColors.mainColor,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10,
            ),
          ],
        ),
        child: const Text(
          'Se connecter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
