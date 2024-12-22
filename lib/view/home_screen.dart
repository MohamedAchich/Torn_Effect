import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/model.dart';
import '../widget/parallax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    // Hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  }

  @override
  void dispose() {
    // Restore the status bar when disposing the screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ParallaxWidget(
        parallaxData: [
          Parallax(
            title: "STRENGTH IN UNITY",
            description:
                "Together we rise, divided we fall. Unity is the foundation of every great achievement.",
            image:
                "https://i.pinimg.com/736x/db/41/f3/db41f3dd17a30fde69fcdbec54e5d359.jpg",
            alignment: const Alignment(-.45, 0),
          ),
          Parallax(
            title: "FORGE YOUR DESTINY",
            description:
                "Every step forward is a step toward greatness. Your future is shaped by the choices you make today.",
            image:
                "https://i.pinimg.com/736x/af/d1/9a/afd19abbdb4f61937a233d475ee11764.jpg",
            alignment: const Alignment(-.6, 0),
          ),
          Parallax(
            title: "WISDOM AND COURAGE",
            description:
                "Knowledge guides our path, but courage moves us forward. Together they create unstoppable momentum.",
            image:
                "https://i.pinimg.com/736x/72/ed/88/72ed885d0be99daf7e7ddecbff206c53.jpg",
            alignment: const Alignment(-.40, 0),
          ),
          Parallax(
            title: "BUILD THE FUTURE",
            description:
                "Innovation and determination are the tools that shape tomorrow. Be the architect of positive change.",
            image:
                "https://i.pinimg.com/736x/5d/9b/a0/5d9ba035378b038d42c9ae617e18de1d.jpg",
            alignment: const Alignment(0, 0),
          ),
          Parallax(
            title: "EMBRACE INNOVATION",
            description: 
                "Technology and creativity merge to create endless possibilities. Push boundaries and redefine what's possible.",
            image: 
                "https://i.pinimg.com/736x/42/aa/06/42aa0633abe996b8fd856218480d98b2.jpg",
            alignment: const Alignment(.6, 0),
          ),
          Parallax(
            title: "NATURE'S HARMONY",
            description: 
                "In nature's grand design, we find the perfect balance of strength and peace. Let it guide your path to excellence.",
            image: 
                "https://i.pinimg.com/736x/57/73/5f/57735f4560b2d5b2c568c588493d62f5.jpg",
            alignment: const Alignment(-.45, 0),
          ),
          Parallax(
            title: "TIMELESS LEGACY",
            description: 
                "Every great achievement started with a single step. Your actions today build the foundation of tomorrow's triumphs.",
            image: 
                "https://i.pinimg.com/736x/19/a9/5b/19a95b54d4f6fd3c6bb4b25029b9aa26.jpg",
            alignment: const Alignment(.6, 0),
          ),
        ],
      ),
    );
  }
}
