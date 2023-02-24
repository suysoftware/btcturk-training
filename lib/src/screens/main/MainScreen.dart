import 'package:btcturk_training/src/screens/main/components/FeedList.dart';
import 'package:flutter/material.dart';

//COMPONENTS
import 'package:btcturk_training/src/widgets/btc_turk_logo.dart';
import 'package:btcturk_training/src/screens/main/components/CategoryList.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          BtcTurkLogo(),
          SizedBox(
            height: 30.0,
          ),
          CategoryList(),
          SizedBox(
            height: 30.0,
          ),
          FeedList()
        ],
      ),
    );
  }
}
