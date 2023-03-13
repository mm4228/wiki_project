import 'package:flutter/material.dart';
import 'package:wiki_projet/users/colors.dart';
import 'package:wiki_projet/views/createaccount.dart';
import 'package:wiki_projet/views/widgets/button.form.dart';
import 'package:wiki_projet/views/widgets/social.login.logo.dart';
import 'package:wiki_projet/views/widgets/text.global.form.dart';
import 'package:get/get.dart';


class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mdpController = TextEditingController();

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
                  child: Text(
                    'Logo',
                    style: TextStyle(
                      color: GlobalsColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Login to your account',
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
                    text1: 'Mail',
                    obscure: false,
                    textInputType: TextInputType.emailAddress),
                const SizedBox(height: 15),
                //Email input
                //Mdp password
                TextGlobalForm(
                    controller: mdpController,
                    text1: 'Mot de passe',
                    textInputType: TextInputType.text,
                    obscure: true),
                const SizedBox(height: 20),
                const ButtonForm(),
                const SizedBox(height: 35),
                SocialLogoLogin(),

              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pas de compte ?  ',
            ),
            InkWell(
              onTap: (){
                print('Je suis ici');
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AccountView(),),);
              },
              child: Text(
                'Créer un compte',
                style: TextStyle(
                  color: GlobalsColors.mainColor,

                ),
              ),
            )
          ],
         
        ),
      ),
    );
  }
}
