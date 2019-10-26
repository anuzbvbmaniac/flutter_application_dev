import 'package:despicableme_character/models/character.dart';
import 'package:despicableme_character/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //take the size of the screen height
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: CharacterCardBackgroundClipper(),
            child: Container(
              height: 0.55 * screenHeight,
              width: 0.9 * screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: characters[0].colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0,-0.5),
          child: Image.asset(
            characters[0].imagePath,
            height: screenHeight * 8.55,
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(characters[0].name, style: AppTheme.heading,),
              Text("Tap to read More", style: AppTheme.subHeading,),
            ],
          ),
        )
      ],
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
