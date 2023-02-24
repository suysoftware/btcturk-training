import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:flutter/material.dart';

class AddReadListButton extends StatelessWidget {
  final Article article;
  AddReadListButton({required this.article});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        readListButtonBuild(),
        dateTextBuild(),
      ],
    );
  }

  Widget readListButtonBuild() {
    return TextButton(onPressed: () {}, child: Text('+ Add my read list',style: StyleConstants.readListStyle,));
  }

  Widget dateTextBuild() {
    return Text(article.publishedAt.toString(),style: StyleConstants.dateStyle,);
  }
}
