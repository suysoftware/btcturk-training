import 'package:btcturk_training/src/screens/main/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sizer/sizer.dart';

import 'src/screens/category/CategoryScreen.dart';
import 'src/screens/detail/DetailScreen.dart';
import 'src/screens/navigation/BottomNavigationBar.dart';

Future<void> main() async {
  await init();
  runApp(const BtcApp());
}

Future<void> init() async {
  await dotenv.load(fileName: ".env");
}

class BtcApp extends StatelessWidget {
  const BtcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: ((context, orientation, deviceType) {
      return const _materialApp();
    }));
  }
}

class _materialApp extends StatefulWidget {
  const _materialApp({super.key});

  @override
  State<_materialApp> createState() => __materialAppState();
}

class __materialAppState extends State<_materialApp>
    with WidgetsBindingObserver {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.inactive) {
      //print('inactive');

    }

    if (state == AppLifecycleState.paused) {
      //print(" altta atıldı");

    }

    if (state == AppLifecycleState.resumed) {}

    if (state == AppLifecycleState.detached) {
      //print('detached');

    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BTC TURK',
      routes: {
        "/": (BuildContext context) => const BtcBottomNavigationBar(),
        "/Main": (BuildContext context) => const MainScreen(),
        "/Category": (BuildContext context) => const CategoryScreen(),
        "/Detail": (BuildContext context) => const DetailScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
