import 'package:flutter/material.dart';
import 'package:news_app_cubit_mvvm/model/source_response.dart';

class SourceTabName extends StatelessWidget {
  SourceTabName({super.key, required this.source, required this.isSelected});
  Source source;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? '',
        style: isSelected
            ? Theme.of(context).textTheme.labelLarge
            : Theme.of(context).textTheme.labelMedium);
  }
}
