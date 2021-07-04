import 'package:wallpaper_flutter/model/categories.dart';

List<Categories> getCategories() {
  List<Categories> categories = new List.empty(growable: true);
  Categories model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  model.categoriesname = "Street Art";
  categories.add(model);
  model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  model.categoriesname = "Wild Life";
  categories.add(model);
  model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  model.categoriesname = "Nature";
  categories.add(model);
  model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/466685/pexels-photo-466685.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  model.categoriesname = "City";
  categories.add(model);
  model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  model.categoriesname = "Motivation";

  categories.add(model);
  model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  model.categoriesname = "Bikes";
  categories.add(model);
  model = new Categories();

  //
  model.imgUrl =
      "https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  model.categoriesname = "Cars";
  categories.add(model);
  model = new Categories();

  return categories;
}
