import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallpaper_flutter/data/data.dart';
import 'package:wallpaper_flutter/widget/widget.dart';
import 'package:wallpaper_flutter/model/categories.dart';

class Wallpaper extends StatefulWidget {
  @override
  _WallpaperState createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List<Categories> categories = new List.empty(growable: true);
  @override
  void initState() {
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
      body: Padding(
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
              Text('Hey there'),
            ],
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
            height: 50.0,
            width: 100.0,
            color: Colors.black38,
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
