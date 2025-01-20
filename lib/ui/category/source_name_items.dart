import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/utils/app_styles.dart';

class SourceNameItems extends StatelessWidget {


  Source source ;
  bool isSelected ;
   SourceNameItems({required this.source , required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? "" ,
    style: isSelected ?
    Theme.of(context).textTheme.labelLarge :
    Theme.of(context).textTheme.labelMedium
      ,);

  }
}
