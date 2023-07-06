import 'package:flutter/material.dart';

import '../../core/Data/categoryDM.dart';
import '../../core/utilities/app_color.dart';

class CategoryGridView extends StatelessWidget {
  Function onClickCategory;
  CategoryDM categoryDM;
  int index;

  CategoryGridView(
      {required this.categoryDM,
      required this.index,
      required this.onClickCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClickCategory(categoryDM);
      },
      child: Container(
        margin: EdgeInsets.only(
            left: index % 2 == 0 ? 15 : 0, right: index % 2 == 0 ? 0 : 15),
        height: MediaQuery.of(context).size.height * 0.22,
        decoration: BoxDecoration(
            color: categoryDM.categoryBackgroundColor,
            borderRadius: BorderRadius.only(
                topRight: const Radius.circular(40),
                bottomRight: Radius.circular(index % 2 == 0 ? 0 : 40),
                topLeft: const Radius.circular(40),
                bottomLeft: Radius.circular(index % 2 == 0 ? 40 : 0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3, child: Image(image: AssetImage(categoryDM.imagePath))),
            Expanded(
                flex: 1,
                child: Text(
                  categoryDM.categoryName,
                  style: TextStyle(fontSize: 22, color: AppColor.primaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
