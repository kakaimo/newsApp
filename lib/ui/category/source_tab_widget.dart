import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/category/source_name_items.dart';
import 'package:news/ui/news/news_widget.dart';
import 'package:news/ui/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {

  List<Source> sourcesList;
  SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            dividerColor: AppColors.transparentColor,
            onTap: (index) {
              selectedIndex = index ;
              setState(() {

              });
            },
            isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).indicatorColor,
              tabs: widget.sourcesList.map((source) {
            return SourceNameItems(source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source));
          }).toList()),
          Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]) )
        ],
      ),
    );
  }
}
