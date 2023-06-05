import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageDetails extends StatelessWidget {
  final String title;
  final String imagePath;

  const LanguageDetails({required this.title, required this.imagePath, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,

        title:  Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            imagePath,
            height: 30,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 32, color: Colors.black),
          ),
        ],
      ),

      ),

    );
  }
}
