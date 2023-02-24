import 'package:flutter/material.dart';

class FeedTitleText extends StatelessWidget {
  final String titleText;
  final TextStyle titleTextStyle;
  FeedTitleText({required this.titleText, required this.titleTextStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: titleTextStyle,
        ),
      ],
    );
  }
}
