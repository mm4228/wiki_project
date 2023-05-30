import 'package:flutter/material.dart';
import 'package:wiki_projet/Models/UserModel.dart';
import 'package:wiki_projet/dbFiles/dbHelper.dart';
import 'package:wiki_projet/users/colors.dart';
import 'package:wiki_projet/views/createaccount.dart';
import 'package:wiki_projet/views/entry_point.dart';
import 'package:wiki_projet/views/login.dart';

class ButtonCreateForm extends StatelessWidget {
  final User? user;
  final Function onPressed;
  final TextEditingController mdpcontroller;
  final TextEditingController mailcontroller;
  const ButtonCreateForm({Key? key, required this.mdpcontroller, required this.mailcontroller, required this.onPressed, this.user}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onPressed();

        final User model = User(mail: mdpcontroller.text, password: mailcontroller.text, id: user?.id);

        if(user == null) {
          await DbHelper.addUser(model);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EntryPointView(),),);

        } else {
          print('Update');
          await DbHelper.updateUser(model);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const EntryPointView(),),);

        }

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