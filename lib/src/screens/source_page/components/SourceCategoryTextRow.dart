import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SourceCategoryTextRow extends StatelessWidget {
  final List<String> categoryList;
  SourceCategoryTextRow({required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            categoryList.isNotEmpty
                ? (categoryList.join(' + ').length > 30
                    ? categoryList.join(' + ').substring(0, 28) + '...'
                    : categoryList.join(' + '))
                : "All Category",
            style: StyleConstants.sourceScreenCategoryTextStyle,
          ),
          TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(ColorConstants.themeDarkBlue)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                '< Go to News',
                style: StyleConstants.sourceScreenBackButtonTextStyle,
              ))
        ],
      ),
    );
  }
}
