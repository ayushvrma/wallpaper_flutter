import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData.dark(),
      home: Wallpaper(),
    );
  }
}

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallpapers'),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        child: Text('Hey there'),
      )),
    );
  }
}
