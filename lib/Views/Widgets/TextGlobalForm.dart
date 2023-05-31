import 'package:flutter/material.dart';

class TextGlobalForm extends StatelessWidget {
  const TextGlobalForm({Key? key, required this.controller, required this.text1, required this.textInputType, required this.obscure}) : super(key: key);
  final TextEditingController controller;
  final String text1;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration:  InputDecoration(
          hintText:  text1,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          hintStyle: const TextStyle(
            height: 1
          )
        ),
      ),
    );
  }
}
