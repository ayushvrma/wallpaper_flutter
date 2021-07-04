import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper',
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: Wallpaper(),
    );
  }
}
