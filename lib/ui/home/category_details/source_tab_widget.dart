import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';
import 'package:news_app_cubit_mvvm/ui/home/category_details/source_tab_name.dart';
import 'package:news_app_cubit_mvvm/ui/home/news/news_details.dart';
import 'package:news_app_cubit_mvvm/utils/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  SourceTabWidget({super.key, required this.sourceList});
  List<Source> sourceList;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sourceList.isEmpty) {
      return const Center(
          child: CircularProgressIndicator(
        color: AppColors.greyColor,
      ));
    }
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourceList.length,
            child: Column(
              children: [
                TabBar(
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Theme.of(context).indicatorColor,
                  dividerColor: AppColors.transparentColor,
                  isScrollable: true,
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  tabs: widget.sourceList.map((e) {
                    return SourceTabName(
                        source: e,
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(e));
                  }).toList(),
                )
              ],
            )),
        Expanded(child: NewsDeatils(source: widget.sourceList[selectedIndex]))
      ],
    );
  }
}
