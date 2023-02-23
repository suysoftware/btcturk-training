import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BtcTurkLogo extends StatelessWidget {
  const BtcTurkLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.0,
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/btcturk_logo.png',
              filterQuality: FilterQuality.high,
            )),
      ),
      decoration: const BoxDecoration(color: ColorConstants.themeDarkBlue),
    );
  }
}
