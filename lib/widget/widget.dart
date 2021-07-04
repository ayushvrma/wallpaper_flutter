import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/model/wallpaper.dart';

Widget topName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Oyus',
        style: TextStyle(color: Color(0xffBB86FC)),
      ),
      Text('Wall')
    ],
  );
}

Widget wallpapersList({List<WallpaperModel> wallpapers, context}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(), //to make scroll smooth
      crossAxisCount: 2, //2 images per row
      childAspectRatio: 0.6, //for vertical aspect ratio
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper) {
        return GridTile(
            child: Container(
                child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            wallpaper.src.portrait,
            fit: BoxFit.cover,
          ),
        )));
      }).toList(),
    ),
  );
}
