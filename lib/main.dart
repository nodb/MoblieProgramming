import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color(0xff1b263b),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xfff89e86),
          ),
        ),
        cardColor: const Color(0xFFF4EDDB),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        // 웹 드래그 기능
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      home: HomeScreen(),
    );
  }
}
