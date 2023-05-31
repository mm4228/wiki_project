import 'package:flutter/material.dart';
import 'package:wiki_projet/Users/GlobalsColors.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SocialLogoLogin extends StatelessWidget {
  const SocialLogoLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('Ou se connecter avec',
            style: TextStyle(
              color: GlobalsColors.textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height : 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Row(
            children: [
              ////google
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10

                      ),
                    ],
                  ),
                  child: SvgPicture.asset('assets/images/google1.svg', height: 30),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10

                      ),
                    ],
                  ),
                  child: SvgPicture.asset('assets/images/facebook.svg', height: 30),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10

                      ),
                    ],
                  ),
                  child: SvgPicture.asset('assets/images/twitter.svg', height: 30),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
