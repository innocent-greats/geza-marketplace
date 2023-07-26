import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'dart:async';
import 'package:geza_lite/screens/onboard/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final List<Color> colors = <Color>[Colors.red, Colors.blue, Colors.amber];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnBoardScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              CustomColor.primaryColor,
              CustomColor.primaryColor,
              CustomColor.primaryColor,
              CustomColor.secondaryColor
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash_logo.png',
              fit: BoxFit.cover,
              height: 350,
              width: 250,
            ),
            // const SizedBox(height: Dimensions.heightSize),
            // Padding(
            //   padding: const EdgeInsets.only(
            //       left: Dimensions.marginSize * 2,
            //       right: Dimensions.marginSize * 2),
            //   child: Text(
            //     Strings.appName,
            //     style: TextStyle(
            //         fontSize: Dimensions.largeTextSize * 1.4,
            //         color: Colors.white),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            const SizedBox(
              height: Dimensions.heightSize * 6,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize * 2,
                  right: Dimensions.marginSize * 2),
              child: Text(
                Strings.loading,
                style: TextStyle(
                    fontSize: Dimensions.largeTextSize, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
