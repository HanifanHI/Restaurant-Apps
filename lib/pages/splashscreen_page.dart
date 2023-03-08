import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/style.dart';
import '../pages/home_page.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  static const String routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (route) => false,
        );
      },
    );

    return Scaffold(
      backgroundColor: cOrangeColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/img_top_wave.png',
                width: double.infinity,
              ),
              Image.asset(
                'assets/images/img_bot_wave.png',
                width: double.infinity,
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FanResto',
                  style: whiteTextstyle.copyWith(
                    fontSize: 36,
                    fontWeight: bold,
                    letterSpacing: 5,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Kamu kenyang kita senang'.toUpperCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                    letterSpacing: 2,
                    color: cWhiteColor,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
