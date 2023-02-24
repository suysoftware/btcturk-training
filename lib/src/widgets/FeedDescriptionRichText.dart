import 'package:flutter/material.dart';

class FeedDescriptionRichText extends StatelessWidget {
  final String descriptionText;
  final TextStyle descriptionTextStyle;
  FeedDescriptionRichText(
      {required this.descriptionText, required this.descriptionTextStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(text: descriptionText, style: descriptionTextStyle));
  }
}
