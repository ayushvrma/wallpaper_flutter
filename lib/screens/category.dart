import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/widget/widget.dart';
import 'package:wallpaper_flutter/constants.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_flutter/model/wallpaper.dart';
import 'dart:convert';

class Categ extends StatefulWidget {
  final String catergoryName;
  Categ({this.catergoryName});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Categ> {
  List<WallpaperModel> wallpapers = new List.empty(growable: true);
  getSearchWallpapers(String query) async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=20'),
        headers: {"Authorization": apikey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  @override
  void initState() {
    getSearchWallpapers(widget.catergoryName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121212),
      appBar: AppBar(
        title: topName(),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xff1F1F1F),
                    borderRadius: BorderRadius.circular(32)),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 15.0),
              ),
              SizedBox(
                height: 16.0,
                width: double.infinity,
              ),
              wallpapersList(wallpapers: wallpapers, context: context),
            ],
          ),
        ),
      ),
    );
  }
}
