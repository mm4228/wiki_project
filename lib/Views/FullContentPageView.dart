import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';

class FullContentPage extends StatelessWidget {
  final String content;

  const FullContentPage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenu complet'),
        backgroundColor: GlobalsColors.mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Text(
            content,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}