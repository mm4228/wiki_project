import 'package:flutter/material.dart';
import 'package:wiki_projet/users/colors.dart';
import 'package:wiki_projet/views/createaccount.dart';
import 'package:wiki_projet/views/entry_point.dart';
import 'package:wiki_projet/views/login.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EntryPointView(),),);
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
        child: const Text('Se connecter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,

          ),
        ),
      ),
    );
  }
}
