import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/model.dart';
import 'parallax.dart';

class ParallaxBody extends StatelessWidget {
  final int index;
  final Parallax data;
  final double pixel;
  final int parallaxLength;

  const ParallaxBody({
    Key? key,
    required this.index,
    required this.data,
    required this.pixel,
    required this.parallaxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double availableHeight = MediaQuery.of(context).size.height;
    final double availableWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: TornEffect(intensity: 21),
      child: SizedBox(
        height: availableHeight,
        width: availableWidth,
        child: Stack(
          fit: StackFit.expand,
          children: [
            FractionalTranslation(
              translation: Offset(
                0.0,
                -_calculateParallax(context),
              ),
              child: Image.network(
                data.image,
                alignment: data.alignment,
                fit: BoxFit.cover,
              ),
            ),
            if (data.title.isNotEmpty)
              Positioned(
                bottom: 200,
                left: 10,
                right: 10,
                child: Container(
                  color: const Color(0xffF3B21A),
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: availableWidth - 20.0, // Adjust the width as needed
                    child: Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            data.title,
                            style: GoogleFonts.secularOne(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 95,
              right: 20,
              left: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  data.description,
                  style: GoogleFonts.cabin(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateParallax(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  return (index - (pixel / height)).clamp(0.0, 1.0);
}
}
