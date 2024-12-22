import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

import '../data/model.dart';
import 'parallex_body.dart';

class ParallaxWidget extends StatefulWidget {
  final List<Parallax> parallaxData;

  const ParallaxWidget({
    Key? key,
    required this.parallaxData,
  }) : super(key: key);

  @override
  State<ParallaxWidget> createState() => _ParallaxWidgetState();
}

class _ParallaxWidgetState extends State<ParallaxWidget> {
  late PageController _pageController;
  late double _pixel;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pixel = 0;
    
    // Listen to page scrolling to update pixel value
    _pageController.addListener(() {
      setState(() {
        _pixel = _pageController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      physics: const PageScrollPhysics(),
      itemCount: widget.parallaxData.length,
      itemBuilder: (context, index) {
        return ParallaxBody(
          index: index,
          pixel: _pixel,
          parallaxLength: widget.parallaxData.length,
          data: widget.parallaxData[index],
        );
      },
    );
  }
}

class TornEffect extends CustomClipper<Path> {
  ///how much the torn effect will be
  final int intensity;

  TornEffect({required this.intensity});

  @override
  ui.Path getClip(ui.Size size) {
    var path = Path();
    //make sure path on left top corner
    path.moveTo(0.0, 0.0);

    var random = math.Random();

    //to prevent blankSpace, move y to top (must always negative):
    double ybase = -20.0;

    //top:
    double topProgress = 0.0;
    while (topProgress < size.width) {
      bool curve = random.nextBool();
      if (curve) {
        double cpx =
            topProgress + random.nextInt(intensity) * 0.5 * _negativePositive();
        double cpy =
            ybase + (random.nextInt(intensity) * 0.25 * _negativePositive());

        double x =
            topProgress + random.nextInt(intensity) * 1.0 * _negativePositive();
        double y =
            ybase + (random.nextInt(intensity) * 0.5 * _negativePositive());

        path.quadraticBezierTo(cpx, cpy, x, y);
        topProgress += x.abs();
      } else {
        double x =
            topProgress + random.nextInt(intensity) * 1.0 * _negativePositive();
        double y =
            ybase + (random.nextInt(intensity) * 0.5 * _negativePositive());
        path.lineTo(x, y);
        topProgress += x.abs();
      }
    }
    //make sure top right corner got shape
    path.lineTo(size.width, 0.0);

    // line to bottom right corner
    path.lineTo(size.width, size.height);

    // you can build bottom rip effect later:
    //double bottomProgress = 0.0;
    //while(){}

    // bottom left
    path.lineTo(0.0, size.height);

    //close it with another line
    path.close();
    return path;
  }

  double _negativePositive() {
    var random = math.Random();
    return random.nextBool() ? 1.0 : -1.0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<ui.Path> oldClipper) {
    return false;
  }
}
