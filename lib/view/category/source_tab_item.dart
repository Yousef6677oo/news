import 'package:flutter/material.dart';
import 'package:news/core/Data/sourcesResponseDM.dart';

import '../../core/utilities/app_color.dart';

class SourceTabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceTabItem(this.source, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.accentColor, width: 2),
          color: isSelected ? AppColor.accentColor : Colors.white,
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        source.name ?? "unknown",
        style: TextStyle(
            fontSize: 16,
            color: isSelected ? Colors.white : AppColor.accentColor),
      ),
    );
  }
}
