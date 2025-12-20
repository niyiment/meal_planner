import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/text_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Nunito", "Nunito");

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp(
      title: 'AI Meal Planner',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [Colors.purple, Colors.black],
              ),
            ),
            child: const Center(
              child: Text("Smooth UI with Impeller 🚀"),
            ),
          ),
        ),
      ),
    );
  }
}
