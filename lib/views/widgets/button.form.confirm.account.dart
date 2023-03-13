import 'package:flutter/material.dart';
import 'package:wiki_projet/users/colors.dart';
import 'package:wiki_projet/views/createaccount.dart';
import 'package:wiki_projet/views/login.dart';

class ButtonCreateAccountForm extends StatelessWidget {
  const ButtonCreateAccountForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginView(),),);
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
        child: const Text('Créer votre compte',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,

          ),
        ),
      ),
    );
  }
}
