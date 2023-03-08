import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/detail_page.dart';
import '../pages/home_page.dart';
import '../pages/splashscreen_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreenPage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => const DetailPage(),
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
      },
    );
  }
}
