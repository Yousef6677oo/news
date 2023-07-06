import 'package:flutter/material.dart';
import 'package:news/view/category/source_tab_item.dart';

import '../../core/Data/sourcesResponseDM.dart';
import '../news/news_list.dart';

class CategoryTabsWidget extends StatefulWidget {
  List<Source> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int currentTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            const SizedBox(height: 12),
            TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((item) => SourceTabItem(
                      item, currentTapIndex == widget.sources.indexOf(item)))
                  .toList(),
              onTap: (index) {
                currentTapIndex = index;
                setState(() {});
              },
            ),
            Expanded(child: NewsList(widget.sources[currentTapIndex]))
          ],
        ),
      ),
    );
  }
}
