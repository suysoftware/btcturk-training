import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:flutter/material.dart';

class ImageBorderWidget extends StatelessWidget {
  final Article article;
  final bool? areWeInDetail;
  ImageBorderWidget({required this.article, this.areWeInDetail});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.areWeInDetail == true) {
        } else {
          Navigator.pushNamed(context, '/Detail', arguments: article);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: SizedBox.fromSize(
          size: Size.fromHeight(227.85),
          child: Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
              ),
        ),
      ),
    );
  }
}
