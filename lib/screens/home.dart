import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_flutter/data/data.dart';
import 'package:wallpaper_flutter/model/wallpaper.dart';
import 'package:wallpaper_flutter/widget/widget.dart';
import 'package:wallpaper_flutter/model/categories.dart';
import 'package:wallpaper_flutter/constants.dart';
import 'package:http/http.dart' as http;

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  getTrendingWallpapers() async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/curated?per_page=30'),
        headers: {"Authorisation": apikey});

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["photos"].forEach((element) {
      WallpaperModel wallpaperModel = new WallpaperModel();
      wallpaperModel = WallpaperModel.fromMap(element);
      wallpapers.add(wallpaperModel);
    });
    setState(() {});
  }

  List<Categories> categories = new List.empty(growable: true);
  List<WallpaperModel> wallpapers = new List.empty(growable: true);
  @override
  void initState() {
    getTrendingWallpapers();
    categories = getCategories();
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff1F1F1F),
                      borderRadius: BorderRadius.circular(32)),
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Wallpapers",
                          ),
                        ),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 80.0,
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: ListView.builder(
                    shrinkWrap: true, //for when inside container
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        title: categories[index].categoriesname,
                        imgUrl: categories[index].imgUrl,
                      );
                    },
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal, //for a horizontal list
                  ),
                ),
                // SizedBox(
                //   height: 16.0,
                // ),
                wallpapersList(wallpapers: wallpapers, context: context),
                //Text('Hey there'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imgUrl, title;
  CategoryTile({this.title, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      child: Stack(
        children: [
          Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  imgUrl,
                  height: 50.0,
                  width: 100.0,
                  fit: BoxFit
                      .cover, //to use as cover image for different resolutions
                )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black38,
            ),
            height: 50.0,
            width: 100.0,
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          )
        ],
      ),
    );
  }
}
