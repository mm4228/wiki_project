import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/Views/Widgets/ButtonCreateAccount.dart';
import 'package:wiki_projet/Views/Widgets/SocialLogoLogin.dart';
import 'package:wiki_projet/Views/Widgets/TextGlobalForm.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';


class CreateAccountView extends StatelessWidget {
  CreateAccountView({Key? key, this.user}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                    alignment: Alignment.center,
                    child:
                    SvgPicture.asset('assets/images/Logo.svg', height: 200)
                ),
                const SizedBox(height: 50),
                Text(
                  'Créer votre compte',
                  style: TextStyle(
                    color: GlobalsColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                //EMail input
                TextGlobalForm(
                    controller: emailController,
                    text1: user?.mail == null ? "Mail" : "2",
                    obscure: false,
                    textInputType: TextInputType.text),
                const SizedBox(height: 15),
                //Email input
                //Mdp password
                TextGlobalForm(
                    controller: mdpController,
                    text1: user?.password == null ? "Mot de passe" : "2",
                    textInputType: TextInputType.text,
                    obscure: true),
                const SizedBox(height: 15),
                ButtonCreateAccount(mailcontroller: emailController, mdpcontroller: mdpController, onPressed: () {
                }),
                const SizedBox(height: 35),
                SocialLogoLogin(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
