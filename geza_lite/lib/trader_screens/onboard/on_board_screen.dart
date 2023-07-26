import 'package:flutter/material.dart';
import 'package:geza_lite/utils/dimensions.dart';
import 'package:geza_lite/utils/strings.dart';
import 'package:geza_lite/utils/colors.dart';
import 'data.dart';
import 'package:geza_lite/screens/intro_screen.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int totalPages = OnBoardingItems.loadOnboardItem().length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.accentColor,
      body: PageView.builder(
          itemCount: totalPages,
          itemBuilder: (context, index) {
            OnBoardingItem oi = OnBoardingItems.loadOnboardItem()[index];
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: Dimensions.heightSize,
                          bottom: Dimensions.heightSize * 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            child: Image.asset(
                              oi.image,
                              fit: BoxFit.fitHeight,
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimensions.marginSize * 2.5,
                                    right: Dimensions.marginSize * 2.5),
                                child: Text(
                                  oi.title,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          Dimensions.extraLargeTextSize * 1.5,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: Dimensions.marginSize * 2,
                                    right: Dimensions.marginSize * 2),
                                child: Text(
                                  oi.subTitle,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Dimensions.extraLargeTextSize),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Align(
                              alignment: Alignment.center,
                              child: index != (totalPages - 1)
                                  ? Padding(
                                      padding:
                                          const EdgeInsets.only(left: 40.0),
                                      child: SizedBox(
                                        width: 100.0,
                                        height: 12.0,
                                        child: ListView.builder(
                                          itemCount: totalPages,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Container(
                                                width: index == i ? 30 : 20.0,
                                                decoration: BoxDecoration(
                                                    color: index == i
                                                        ? CustomColor
                                                            .primaryColor
                                                        : CustomColor
                                                            .secondaryColor,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5.0))),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          height: 50,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                              color: CustomColor.primaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      Dimensions.radius *
                                                          0.5))),
                                          child: Center(
                                            child: Text(
                                              Strings.getStarted.toUpperCase(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize:
                                                      Dimensions.largeTextSize,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const IntroScreen()));
                                      },
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: -20,
                      right: 10,
                      child: Image.asset(oi.subImage),
                    )
                  ],
                ));
          }),
    );
  }
}
