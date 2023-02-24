import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  final List<Widget> widgetList;
  final CarouselController controller;
  final int current;
  SliderDots(
      {required this.widgetList,
      required this.controller,
      required this.current});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgetList.asMap().entries.map((entry) {
        return GestureDetector(
          onTap: () => controller.animateToPage(entry.key),
          child: Container(
            width: 10.0,
            height: 10.0,
            margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (Theme.of(context).brightness == Brightness.dark
                        ? Color(0xffC9DBEE)
                        : Color(0xff052C54))
                    .withOpacity(current == entry.key ? 0.9 : 0.4)),
          ),
        );
      }).toList(),
    );
  }
}
