import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_flutter/model/wallpaper.dart';
import 'package:wallpaper_flutter/screens/image_view.dart';

Widget topName() {
  return RichText(
    text: TextSpan(
      text: '',
      style: TextStyle(
        fontSize: 16.0,
      ),
      children: const <TextSpan>[
        TextSpan(
            text: 'Oyus',
            style: TextStyle(
                color: Color(0xffBB86FC), fontWeight: FontWeight.w500)),
        TextSpan(
            text: 'Wall',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      ],
    ),
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
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ImageView(
                          imgPath: wallpaper.src.portrait,
                        )));
          },
          child: Hero(
            tag: wallpaper.src.portrait,
            child: GridTile(
                child: Container(
                    child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                wallpaper.src.portrait,
                fit: BoxFit.cover,
              ),
            ))),
          ),
        );
      }).toList(),
    ),
  );
}
