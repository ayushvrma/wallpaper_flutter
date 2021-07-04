import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_flutter/widget/widget.dart';

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: topName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.black12),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration:
                            InputDecoration(hintText: "Search Wallpapers"),
                      ),
                    ),
                    Icon(Icons.search)
                  ],
                ),
              ),
              Text('Hey there'),
            ],
          ),
        ),
      ),
    );
  }
}
