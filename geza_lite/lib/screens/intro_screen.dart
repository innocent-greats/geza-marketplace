import 'package:flutter/material.dart';
import 'package:geza_lite/utils/colors.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/screens/auth/sign_up_screen.dart';
import 'package:geza_lite/screens/auth/sign_in_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            //     Strings.beautyParlourBookingApp,
            //     style: TextStyle(
            //         fontSize: Dimensions.largeTextSize * 1.5,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold),
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
              child: GestureDetector(
                child: Container(
                  height: Dimensions.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: Center(
                    child: Text(
                      Strings.signIn.toUpperCase(),
                      style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignInScreen()));
                },
              ),
            ),
            const SizedBox(
              height: Dimensions.heightSize,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: Dimensions.marginSize * 2,
                  right: Dimensions.marginSize * 2),
              child: GestureDetector(
                child: Container(
                  height: Dimensions.buttonHeight,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: CustomColor.accentColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius)),
                  child: Center(
                    child: Text(
                      Strings.signUp.toUpperCase(),
                      style: TextStyle(
                          fontSize: Dimensions.extraLargeTextSize,
                          color: CustomColor.primaryColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SignUpScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
