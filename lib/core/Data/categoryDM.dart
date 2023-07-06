import 'package:flutter/material.dart';

class CategoryDM {
  String categoryName;
  String categoryID;
  String imagePath;
  Color categoryBackgroundColor;

  CategoryDM(
      {required this.categoryName,
      required this.categoryID,
      required this.imagePath,
      required this.categoryBackgroundColor});
}
